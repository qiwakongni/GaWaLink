//
//  QuotesHomeView.swift
//  GaWaLink
//
//  Created by watashi on 2026/01/07.
//

import SwiftUI

struct MarketView: View {

    @StateObject private var vm = MarketViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                mainSegment
                subTabs
                headerRow
                Divider()

                if vm.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let error = vm.errorMessage {
                    VStack(spacing: 12) {
                        Text(error)
                            .font(.system(size: 14))
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                        Button("重试") {
                            Task { await vm.refresh() }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(vm.displayedCoins) { coin in
                                MarketRowView(
                                    coin: coin,
                                    isFavorite: vm.isFavorite(coin),
                                    priceText: vm.formatPrice(coin.currentPrice),
                                    marketCapText: vm.formatMarketCap(
                                        coin.marketCap,
                                        rank: coin.marketCapRank
                                    ),
                                    changeText: vm.formatChange(
                                        coin.priceChangePercentage24H
                                    ),
                                    changeColor: vm.changeColor(
                                        coin.priceChangePercentage24H
                                    ),
                                    onToggleFavorite: {
                                        vm.toggleFavorite(coin)
                                    }
                                )
                                Divider()
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 4)
                    }
                    .refreshable {
                        await vm.refresh()
                    }
                }
            }
            .navigationTitle("行情")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // TODO: 搜索逻辑
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                }
            }
            .task {
                vm.onAppear()
            }
        }
    }

    // MARK: - UI 组件

    private var mainSegment: some View {
        HStack(spacing: 8) {
            segmentButton(title: "交易", tab: .trade)
            segmentButton(title: "行情", tab: .market)
        }
        .padding(.vertical, 8)
    }

    private func segmentButton(title: String, tab: MarketMainTab) -> some View {
        Button {
            vm.mainTab = tab
        } label: {
            Text(title)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(vm.mainTab == tab ? .primary : .secondary)
                .padding(.horizontal, 20)
                .padding(.vertical, 6)
                .background(
                    Capsule()
                        .fill(vm.mainTab == tab
                              ? Color(.systemGray5)
                              : Color.clear)
                )
        }
    }

    private var subTabs: some View {
        HStack(spacing: 24) {
            subTabButton("自选", .favorites)
            subTabButton("市值", .marketCap)
            subTabButton("DeFi", .defi)
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
    }

    private func subTabButton(_ title: String, _ tab: MarketSubTab) -> some View {
        VStack(spacing: 4) {
            Button {
                vm.subTab = tab
            } label: {
                Text(title)
                    .font(.system(size: 15))
                    .foregroundColor(vm.subTab == tab ? .blue : .primary)
            }
            Rectangle()
                .fill(vm.subTab == tab ? Color.blue : .clear)
                .frame(height: 2)
        }
    }

    private var headerRow: some View {
        HStack {
            Text("市值")
                .font(.system(size: 12))
                .foregroundStyle(.secondary)

            Spacer()

            Button {
                vm.togglePriceSort()
            } label: {
                HStack(spacing: 4) {
                    Text("价格")
                        .font(.system(size: 12))
                    Image(systemName: vm.sortOption.systemImageName)
                        .font(.system(size: 10))
                }
                .foregroundStyle(.secondary)
            }

            Spacer()

            Text("涨跌幅")
                .font(.system(size: 12))
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 16)
        .padding(.top, 4)
    }
}

#Preview {
    MarketView()
}
