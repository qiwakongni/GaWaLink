//
//  MarketCoin.swift
//  GaWaLink
//
//  Created by watashi on 2026/01/08.
//

import Foundation

struct MarketCoin: Identifiable, Codable, Equatable {
    let id: String           // CoinGecko 的 id
    let symbol: String
    let name: String
    let image: String?
    let currentPrice: Double?
    let marketCap: Double?
    let marketCapRank: Int?
    let priceChangePercentage24H: Double?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case priceChangePercentage24H = "price_change_percentage_24h"
    }
}
