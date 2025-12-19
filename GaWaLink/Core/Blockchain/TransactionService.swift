//
//  TransactionService.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/07.
//

import Foundation

final class TransactionService {

    func sendTransaction(to: String, amount: String, completion: @escaping (String) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            completion("交易已广播 ✅")
        }
    }
}

