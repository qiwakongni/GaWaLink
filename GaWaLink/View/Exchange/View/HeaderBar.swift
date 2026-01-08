//
//  HeaderBar.swift
//  GaWaLink
//
//  Created by watashi on 2026/01/07.
//

import SwiftUI

struct HeaderBar: View {
    let title: String
    var onRightTap: () -> Void

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 30, weight: .bold))
                .foregroundStyle(.black)

            Spacer()

            Button(action: onRightTap) {
                Image(systemName: "doc.text")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(.black)
                    .frame(width: 36, height: 36)
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.black.opacity(0.06))
                    )
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    HeaderBar(title: "兑换", onRightTap: {})
        .padding()
        .background(Color.white)
}

