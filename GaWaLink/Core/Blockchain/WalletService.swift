//
//  WalletService.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/07.
//

import Foundation
import BigInt
import Security
import web3swift
import Web3Core

final class WalletService {

    static let shared = WalletService()

    private init() {}

    // Keychain 存储 Key
    private let keystoreKey = "wallet_keystore_json"
    private let mnemonicKey = "wallet_mnemonic"

    // MARK: - ✅ 创建新钱包（返回 助记词 + Wallet）
    func createNewWallet(password: String) throws -> (mnemonic: String, wallet: Wallet) {

        // ✅ 1. 生成助记词（新 SDK）
        let mnemonic = try BIP39.generateMnemonics(bitsOfEntropy: 128)

        // ✅ 2. 通过助记词创建 Keystore（新 SDK）
        let keystore: BIP32Keystore = try BIP32Keystore(
            mnemonics: mnemonic!,
            password: password,
            mnemonicsPassword: ""
        )!

        // ✅ 3. 取第一个地址
        guard let address = keystore.addresses?.first else {
            throw NSError(domain: "WalletService", code: -1003,
                          userInfo: [NSLocalizedDescriptionKey: "地址生成失败"])
        }

        // ✅ 4. Keystore 转 JSON Data
        let data = try JSONEncoder().encode(keystore.keystoreParams)

        // ✅ 5. 存 Keychain
        saveToKeychain(key: keystoreKey, data: data)
        saveToKeychain(key: mnemonicKey, data: Data(mnemonic!.utf8))

        // ✅ 6. 返回钱包模型
        let wallet = Wallet(address: address.address, keystoreJSON: "")

        return ("", wallet)
    }


    // MARK: - ✅ 用助记词导入钱包
    func importWallet(mnemonic: String, password: String) throws -> Wallet {

        guard let keystore = try BIP32Keystore(
            mnemonics: mnemonic,
            password: password,
            mnemonicsPassword: "",
            language: .english
        ) else {
            throw NSError(domain: "WalletService", code: -2001, userInfo: [NSLocalizedDescriptionKey: "助记词生成 Keystore 失败"])
        }

        guard let address = keystore.addresses?.first?.address else {
            throw NSError(domain: "WalletService", code: -2002, userInfo: [NSLocalizedDescriptionKey: "地址生成失败"])
        }

        let keystoreData = try JSONEncoder().encode(keystore.keystoreParams)
        let keystoreJSON = String(decoding: keystoreData, as: UTF8.self)

        saveToKeychain(key: keystoreKey, data: keystoreData)
        saveToKeychain(key: mnemonicKey, data: Data(mnemonic.utf8))

        let wallet = Wallet(
            address: "0x" + address,
            keystoreJSON: keystoreJSON
        )

        return wallet
    }

    // MARK: - ✅ 加载当前钱包
    func loadCurrentWallet() -> Wallet? {

        guard
            let keystoreData = loadFromKeychain(key: keystoreKey),
            let keystore = try? BIP32Keystore(keystoreData)
        else {
            return nil
        }

        guard let address = keystore.addresses?.first?.address else {
            return nil
        }

        let json = String(decoding: keystoreData, as: UTF8.self)

        return Wallet(
            address: address,
            keystoreJSON: json
        )
    }


    // MARK: - ✅ 导出助记词
    func exportMnemonic() -> String? {
        guard let data = loadFromKeychain(key: mnemonicKey) else { return nil }
        return String(decoding: data, as: UTF8.self)
    }
}

// MARK: - 🔐 Keychain 私有封装
private extension WalletService {

    func saveToKeychain(key: String, data: Data) {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecValueData: data
        ]

        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
    }

    func loadFromKeychain(key: String) -> Data? {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ]

        var result: AnyObject?
        SecItemCopyMatching(query as CFDictionary, &result)
        return result as? Data
    }
}
