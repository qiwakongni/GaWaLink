//
//  MarketViewModel.swift
//  GaWaLink
//
//  Created by watashi on 2026/01/08.
//

import Foundation
import SwiftUI

enum MarketMainTab: Int {
    case trade = 0
    case market = 1
}

enum MarketSubTab: Int {
    case favorites = 0
    case marketCap = 1
    case defi = 2
}

enum MarketSortOption {
    case rank
    case priceAsc
    case priceDesc
    case changeDesc

    mutating func togglePrice() {
        switch self {
        case .priceAsc: self = .priceDesc
        default:        self = .priceAsc
        }
    }

    var systemImageName: String {
        switch self {
        case .priceAsc:  return "arrow.down"
        case .priceDesc: return "arrow.up"
        default:         return "arrow.up.arrow.down"
        }
    }
}

@MainActor
final class MarketViewModel: ObservableObject {

    @Published var mainTab: MarketMainTab = .market
    @Published var subTab: MarketSubTab = .marketCap

    @Published var allCoins: [MarketCoin] = []
    @Published var defiCoins: [MarketCoin] = []

    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var sortOption: MarketSortOption = .rank

    @Published private(set) var watchlist: Set<String>

    private let service: MarketAPI
    private let watchlistStore: MarketWatchlistStore

    init(service: MarketAPI = MarketCoinGeckoService(),
         watchlistStore: MarketWatchlistStore = .shared) {
        self.service = service
        self.watchlistStore = watchlistStore
        self.watchlist = watchlistStore.load()
    }

    func onAppear() {
        Task { await refresh() }
    }

    func refresh() async {
        errorMessage = nil
        isLoading = true
        defer { isLoading = false }

        do {
            async let marketCap = service.fetchCoins(type: .marketCap)
            async let defi = service.fetchCoins(type: .defi)

            let (capCoins, defiCoins) = try await (marketCap, defi)
            self.allCoins = capCoins
            self.defiCoins = defiCoins
        } catch {
            self.errorMessage = "加载失败，请稍后重试：\(error.localizedDescription)"
        }
    }

    func toggleFavorite(_ coin: MarketCoin) {
        if watchlist.contains(coin.id) {
            watchlist.remove(coin.id)
        } else {
            watchlist.insert(coin.id)
        }
        watchlistStore.save(watchlist)
    }

    func isFavorite(_ coin: MarketCoin) -> Bool {
        watchlist.contains(coin.id)
    }

    func togglePriceSort() {
        sortOption.togglePrice()
    }

    // 对外提供当前展示的数据
    var displayedCoins: [MarketCoin] {
        let source: [MarketCoin]
        switch subTab {
        case .favorites:
            source = allCoins.filter { watchlist.contains($0.id) }
        case .marketCap:
            source = allCoins
        case .defi:
            source = defiCoins
        }

        return source.sorted(by: sortPredicate)
    }

    private func sortPredicate(_ lhs: MarketCoin, _ rhs: MarketCoin) -> Bool {
        switch sortOption {
        case .rank:
            return (lhs.marketCapRank ?? .max) < (rhs.marketCapRank ?? .max)
        case .priceAsc:
            return (lhs.currentPrice ?? 0) < (rhs.currentPrice ?? 0)
        case .priceDesc:
            return (lhs.currentPrice ?? 0) > (rhs.currentPrice ?? 0)
        case .changeDesc:
            return (lhs.priceChangePercentage24H ?? -1000) >
                   (rhs.priceChangePercentage24H ?? -1000)
        }
    }

    // MARK: - 格式化

    func formatPrice(_ value: Double?) -> String {
        guard let value else { return "-" }
        if value >= 1 {
            return String(format: "$%.2f", value)
        } else if value >= 0.01 {
            return String(format: "$%.4f", value)
        } else {
            return String(format: "$%.6f", value)
        }
    }

    func formatMarketCap(_ value: Double?, rank: Int?) -> String {
        guard let value else {
            return "#\(rank ?? 0) -"
        }

        let billion = value / 1_000_000_000
        if billion >= 10_000 {
            let wanYi = billion / 10_000
            return String(format: "#%d $%.2f 万亿", rank ?? 0, wanYi)
        } else {
            return String(format: "#%d $%.2f 亿", rank ?? 0, billion)
        }
    }

    func formatChange(_ value: Double?) -> String {
        guard let value else { return "-" }
        return String(format: "%.2f%%", value)
    }

    func changeColor(_ value: Double?) -> Color {
        guard let value else { return .secondary }
        if value > 0 {
            return .green
        } else if value < 0 {
            return .red
        } else {
            return .secondary
        }
    }
}
