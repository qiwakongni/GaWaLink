//
//  ExchangeCard.swift
//  GaWaLink
//
//  Created by watashi on 2026/01/07.
//

import SwiftUI

struct ExchangeCard: View {
    @Binding var sellToken: ExchangeToken
    @Binding var buyToken: ExchangeToken
    @Binding var sellAmount: String
    @Binding var buyAmount: String

    var onSwap: () -> Void

    var body: some View {
        ZStack {
            VStack(spacing: 14) {
                TokenAmountRow(
                    title: "卖出",
                    token: $sellToken,
                    balanceText: "0.00",
                    showMax: true,
                    amountText: $sellAmount
                )

                Divider().overlay(.black.opacity(0.08))

                TokenAmountRow(
                    title: "买入",
                    token: $buyToken,
                    balanceText: "0.00",
                    showMax: false,
                    amountText: $buyAmount
                )
            }
            .padding(16)
            .background(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .fill(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(.black.opacity(0.12), lineWidth: 1)
                            )
                    )
        }
        .overlay(alignment: .center) {
            SwapButton(action: onSwap)
        }
    }
}

#Preview {
    @Previewable @State var sell: ExchangeToken = .usdtBnb
    @Previewable @State var buy: ExchangeToken = .trx
    @Previewable @State var a = "0.00"
    @Previewable @State var b = "0.00"

    return ExchangeCard(
        sellToken: $sell,
        buyToken: $buy,
        sellAmount: $a,
        buyAmount: $b,
        onSwap: {}
    )
    .padding()
    .background(Color.white)
}
