//
//  ExchangeToken.swift
//  GaWaLink
//
//  Created by watashi on 2026/01/07.
//

import SwiftUI

enum ExchangeToken: CaseIterable, Identifiable {
    case usdtBnb
    case trx

    var id: String { symbol }

    var symbol: String {
        switch self {
        case .usdtBnb: "USDT"
        case .trx: "TRX"
        }
    }

    var chainText: String {
        switch self {
        case .usdtBnb: "BNB chain"
        case .trx: "Tron"
        }
    }

    // 下面是占位视觉数据：后续你可换成 Asset 图标
    var iconColor: Color {
        switch self {
        case .usdtBnb: Color(hex: 0x16A085) // USDT 绿
        case .trx: Color(hex: 0xE74C3C)     // TRX 红
        }
    }

    var chainBadgeColor: Color {
        switch self {
        case .usdtBnb: Color(hex: 0xF0B90B) // BNB 黄
        case .trx: Color(hex: 0xE74C3C)
        }
    }

    var iconLetter: String {
        switch self {
        case .usdtBnb: "T"
        case .trx: "T"
        }
    }

    var chainBadgeLetter: String {
        switch self {
        case .usdtBnb: "B"
        case .trx: "T"
        }
    }
}

