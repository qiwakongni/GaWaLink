//
//  RateRow.swift
//  GaWaLink
//
//  Created by watashi on 2026/01/07.
//

import SwiftUI

struct RateRow: View {
    let sellSymbol: String
    let buySymbol: String
    let rateText: String
    var onRefresh: () -> Void

    var body: some View {
        HStack(spacing: 8) {
            Text("汇率： 1 \(sellSymbol)=\(rateText) \(buySymbol)")
                .font(.system(size: 14))
                .foregroundStyle(.black.opacity(0.65))

            Spacer()

            Button(action: onRefresh) {
                Image(systemName: "arrow.clockwise")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.black.opacity(0.65))
                    .padding(6)
                    .background(
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(.black.opacity(0.05))
                    )
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    RateRow(sellSymbol: "USDT", buySymbol: "TRX", rateText: "3.6647436", onRefresh: {})
        .padding()
        .background(Color.white)
}
