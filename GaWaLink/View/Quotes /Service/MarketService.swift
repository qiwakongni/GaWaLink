//
//  MarketService.swift
//  GaWaLink
//
//  Created by watashi on 2026/01/08.
//

import Foundation

enum MarketListType {
    case marketCap
    case defi
}

protocol MarketAPI {
    func fetchCoins(type: MarketListType) async throws -> [MarketCoin]
}

struct MarketCoinGeckoService: MarketAPI {

    func fetchCoins(type: MarketListType) async throws -> [MarketCoin] {
        var components = URLComponents(string: "https://api.coingecko.com/api/v3/coins/markets")!
        var queryItems: [URLQueryItem] = [
            .init(name: "vs_currency", value: "usd"),
            .init(name: "order", value: "market_cap_desc"),
            .init(name: "per_page", value: "100"),
            .init(name: "page", value: "1"),
            .init(name: "sparkline", value: "false"),
            .init(name: "price_change_percentage", value: "24h")
        ]

        // DeFi 分类
        if case .defi = type {
            queryItems.append(.init(name: "category", value: "decentralized_finance_defi"))
        }

        components.queryItems = queryItems

        let (data, response) = try await URLSession.shared.data(from: components.url!)
        guard let http = response as? HTTPURLResponse,
              200..<300 ~= http.statusCode else {
            throw URLError(.badServerResponse)
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode([MarketCoin].self, from: data)
    }
}
