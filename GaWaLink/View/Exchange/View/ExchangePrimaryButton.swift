//
//  ExchangePrimaryButton.swift
//  GaWaLink
//
//  Created by watashi on 2026/01/07.
//

import SwiftUI

struct ExchangePrimaryButton: View {
    let title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.black.opacity(0.85))
                .frame(maxWidth: .infinity)
                .frame(height: 54)
                .background(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(Color(hex: 0xF4C51C))
                )
        }
        .buttonStyle(.plain)
        .padding(.top, 6)
    }
}

#Preview {
    ExchangePrimaryButton(title: "兑换", action: {})
        .padding()
        .background(Color.white)
}
