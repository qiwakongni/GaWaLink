//
//  TransactionHistoryService.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/07.
//

import Foundation

final class TransactionHistoryService {

    private let session = URLSession.shared
    private let apiBase = "https://api.etherscan.io/api"
    private let apiKey = "<你的 API Key>"

    func fetchTransactions(
        address: String,
        completion: @escaping ([TransactionRecord]) -> Void
    ) {
        // 这里只是示例 URL，按你实际用的区块链浏览器 API 改
        let urlString = "\(apiBase)?module=account&action=txlist&address=\(address)&sort=desc&apikey=\(apiKey)"
        guard let url = URL(string: urlString) else {
            completion([])
            return
        }

        session.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion([])
                return
            }

            // TODO: 按实际返回 JSON 结构解析，这里只给示意
            // 你可以创建一个 Response 类型来 decode
            // 为了简化，这里先返回空数组
            completion([])
        }.resume()
    }
}
