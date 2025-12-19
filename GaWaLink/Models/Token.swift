//
//  Token.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/07.
//

import Foundation

struct Token: Identifiable {
    let id = UUID()
    let name: String       // USDT
    let symbol: String     // USDT
    let contract: String   // 合约地址
    let decimals: Int
}
