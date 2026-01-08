import SwiftUI

struct ExchangeView: View {
    @State private var sellToken: ExchangeToken = .usdtBnb
    @State private var buyToken: ExchangeToken = .trx

    @State private var sellAmount: String = "0.00"
    @State private var buyAmount: String = "0.00"

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack(spacing: 18) {
                HeaderBar(title: "兑换") {
                    // TODO: 右上角按钮动作（例如打开兑换记录）
                }

                ExchangeCard(
                    sellToken: $sellToken,
                    buyToken: $buyToken,
                    sellAmount: $sellAmount,
                    buyAmount: $buyAmount,
                    onSwap: swapTokens
                )

                RateRow(
                    sellSymbol: sellToken.symbol,
                    buySymbol: buyToken.symbol,
                    rateText: "3.6647436"
                ) {
                    // TODO: 刷新汇率
                }

                PrimaryButton(title: "兑换") {
                    // TODO: 兑换动作
                }

                Spacer(minLength: 0)
            }
            .padding(.horizontal, 18)
            .padding(.top, 18)
        }
    }

    private func swapTokens() {
        (sellToken, buyToken) = (buyToken, sellToken)
        // 可选：交换数值
        // (sellAmount, buyAmount) = (buyAmount, sellAmount)
    }
}

#Preview {
    ExchangeView()
}

