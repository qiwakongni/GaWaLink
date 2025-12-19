//
//  ERC20Service.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/07.
//

import Foundation
import web3swift
import Web3Core
import BigInt

final class ERC20Service {

    private let web3: Web3

    // ✅ 新版 SDK：async init + Optional Provider 正确解包
    init(rpcURL: String) async throws {
        guard let url = URL(string: rpcURL) else {
            throw NSError(domain: "ERC20", code: -1000,
                          userInfo: [NSLocalizedDescriptionKey: "RPC URL 非法"])
        }

        guard let provider = try await Web3HttpProvider(
            url,
            network: .Mainnet
        ) else {
            throw NSError(domain: "ERC20", code: -1001,
                          userInfo: [NSLocalizedDescriptionKey: "RPC Provider 创建失败"])
        }

        self.web3 = Web3(provider: provider)
    }

    func fetchTokenBalance(
        walletAddress: String,
        token: Token,
        completion: @escaping (Result<String, Error>) -> Void
    ) {
        Task.detached {
            do {
                guard let wallet = EthereumAddress(walletAddress),
                      let contractAddr = EthereumAddress(token.contract) else {
                    throw NSError(domain: "ERC20", code: -1,
                                  userInfo: [NSLocalizedDescriptionKey: "地址非法"])
                }

                let contract = self.web3.contract(
                    Web3.Utils.erc20ABI,
                    at: contractAddr
                )!

                // ✅ 新 SDK：用 createReadOperation 代替 read
                let operation = contract.createReadOperation(
                    "balanceOf",
                    parameters: [wallet] as [AnyObject],
                    extraData: Data()
                )!

                let result = try await operation.callContractMethod()

                guard let raw = result["0"] as? BigUInt else {
                    throw NSError(domain: "ERC20", code: -2,
                                  userInfo: [NSLocalizedDescriptionKey: "返回数据异常"])
                }

                let divisor = BigUInt(10).power(token.decimals)
                let value = Double(raw) / Double(divisor)
                let formatted = String(format: "%.6f", value)

                completion(.success(formatted))

            } catch {
                completion(.failure(error))
            }
        }
    }
}
