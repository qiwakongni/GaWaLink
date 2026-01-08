//
//  TokenAmountRow.swift
//  GaWaLink
//
//  Created by watashi on 2026/01/07.
//

import SwiftUI

struct TokenAmountRow: View {
    let title: String
    @Binding var token: ExchangeToken

    let balanceText: String
    let showMax: Bool
    @Binding var amountText: String

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.black.opacity(0.55))

                HStack(spacing: 10) {
                    TokenIcon(token: token)

                    Button {
                        // TODO: 选择币种（弹 sheet / push）
                    } label: {
                        HStack(spacing: 6) {
                            VStack(alignment: .leading, spacing: 2) {
                                HStack(spacing: 6) {
                                    Text(token.symbol)
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundStyle(.black)

                                    Image(systemName: "chevron.down")
                                        .font(.system(size: 12, weight: .semibold))
                                        .foregroundStyle(.black.opacity(0.6))
                                }

                                Text(token.chainText)
                                    .font(.system(size: 13))
                                    .foregroundStyle(.black.opacity(0.55))
                            }
                            Spacer(minLength: 0)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 10) {
                HStack(spacing: 8) {
                    Image(systemName: "wallet.pass")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.black.opacity(0.55))

                    Text(balanceText)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.black.opacity(0.65))

                    if showMax {
                        Text("MAX")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(.green.opacity(0.9))
                    }
                }

                Text(amountText)
                    .font(.system(size: 34, weight: .bold))
                    .foregroundStyle(.black)
                    .lineLimit(1)
                    .minimumScaleFactor(0.6)
            }
        }
    }
}

#Preview {
    @Previewable @State var t: ExchangeToken = .usdtBnb
    @Previewable @State var amt: String = "0.00"

    return TokenAmountRow(
        title: "卖出",
        token: $t,
        balanceText: "0.00",
        showMax: true,
        amountText: $amt
    )
    .padding()
    .background(Color.white)
}

