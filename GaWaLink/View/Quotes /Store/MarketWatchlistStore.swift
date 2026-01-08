//
//  MarketWatchlistStore.swift
//  GaWaLink
//
//  Created by watashi on 2026/01/08.
//

import Foundation

final class MarketWatchlistStore {
    private let key = "market_watchlist_ids"

    static let shared = MarketWatchlistStore()

    private init() {}

    func load() -> Set<String> {
        let defaults = UserDefaults.standard
        if let array = defaults.array(forKey: key) as? [String] {
            return Set(array)
        }
        return []
    }

    func save(_ ids: Set<String>) {
        UserDefaults.standard.set(Array(ids), forKey: key)
    }
}
