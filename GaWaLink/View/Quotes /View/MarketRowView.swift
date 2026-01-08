//
//  MarketRowView.swift
//  GaWaLink
//
//  Created by watashi on 2026/01/08.
//

import SwiftUI

struct MarketRowView: View {
    let coin: MarketCoin
    let isFavorite: Bool

    let priceText: String
    let marketCapText: String
    let changeText: String
    let changeColor: Color

    let onToggleFavorite: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(coin.symbol.uppercased())
                    .font(.system(size: 16, weight: .semibold))

                Text(marketCapText)
                    .font(.system(size: 12))
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Text(priceText)
                .font(.system(size: 15, weight: .medium))

            Spacer()

            Text(changeText)
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(changeColor)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color(.systemGray5))
                )
        }
        .padding(.vertical, 8)
        .contentShape(Rectangle())
        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
            Button {
                onToggleFavorite()
            } label: {
                Label(isFavorite ? "移出自选" : "加入自选",
                      systemImage: isFavorite ? "star.slash" : "star")
            }
            .tint(.orange)
        }
    }
}
