//
//  SwapButton.swift
//  GaWaLink
//
//  Created by watashi on 2026/01/07.
//

import SwiftUI

struct SwapButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(.black.opacity(0.06))
                    .frame(width: 46, height: 46)

                Image(systemName: "arrow.up.arrow.down")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(.black.opacity(0.75))
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    SwapButton(action: {})
        .padding()
        .background(Color.white)
}

