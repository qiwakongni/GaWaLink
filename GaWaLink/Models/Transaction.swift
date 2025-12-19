//
//  Transaction.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/07.
//

import Foundation

struct TransactionRecord: Identifiable {
    let id = UUID()
    let hash: String
    let from: String
    let to: String
    let value: String      // 已格式化后的字符串
    let time: Date
}
