//
//  BalanceService.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/07.
//

import Foundation

final class BalanceService {

    func fetchBalance(address: String, completion: @escaping (String) -> Void) {
        // ⚠️ 这里未来替换为真实 RPC 请求
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            completion("1.2345")
        }
    }
}
