//
//  Wallet.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/07.
//

import Foundation

struct Wallet {
    let address: String        // 0x...
    let keystoreJSON: String   // web3swift keystore 的 JSON（加密后的私钥）
}
