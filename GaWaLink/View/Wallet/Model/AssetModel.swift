//
//  AssetModel.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/09.
//

import Foundation

enum ChainType: String, Codable {
    case ethereum
    case bsc
    case tron
}

struct AssetModel: Identifiable, Codable {
    let id = UUID()
    let symbol: String
    let name: String
    let priceUSD: Double
    let balance: Double
    let chain: ChainType
}
