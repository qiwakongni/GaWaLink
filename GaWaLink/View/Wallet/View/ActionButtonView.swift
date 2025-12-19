//
//  ActionButtonView.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/09.
//

import SwiftUI

struct ActionButtonView: View {
    
    let title: String
    let icon: String
    
    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.black)
            
            Text(title)
                .foregroundColor(.black)
                .font(.caption)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.black.opacity(0.2))
        .cornerRadius(12)
    }
}
