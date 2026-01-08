//
//  TokenIcon.swift
//  GaWaLink
//
//  Created by watashi on 2026/01/07.
//

import SwiftUI

struct TokenIcon: View {
    let token: ExchangeToken

    var body: some View {
        ZStack {
            Circle()
                .fill(token.iconColor.opacity(0.18))
                .frame(width: 44, height: 44)

            Text(token.iconLetter)
                .font(.system(size: 18, weight: .black))
                .foregroundStyle(token.iconColor)
        }
        .overlay(alignment: .bottomTrailing) {
            Circle()
                .fill(token.chainBadgeColor)
                .frame(width: 16, height: 16)
                .overlay(
                    Text(token.chainBadgeLetter)
                        .font(.system(size: 9, weight: .bold))
                        .foregroundStyle(.white)
                )
                .offset(x: 2, y: 2)
        }
    }
}

#Preview {
    VStack(spacing: 12) {
        TokenIcon(token: .usdtBnb)
        TokenIcon(token: .trx)
    }
    .padding()
    .background(Color.white)
}
