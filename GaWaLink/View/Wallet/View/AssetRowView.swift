//
//  AssetRowView.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/09.
//

import SwiftUI

struct AssetRowView: View {
    
    let asset: AssetModel
    
    var body: some View {
        HStack {
            
            Circle()
                .fill(Color.orange)
                .frame(width: 40, height: 40)
                .overlay(
                    Text(asset.symbol.prefix(1))
                        .foregroundColor(.black)
                        .font(.headline)
                )
            
            VStack(alignment: .leading) {
                Text(asset.symbol)
                    .foregroundColor(.black)
                    .font(.headline)
                
                Text("≈ $\(asset.priceUSD, specifier: "%.4f")")
                    .foregroundColor(.gray)
                    .font(.caption)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(asset.balance, specifier: "%.4f")")
                    .foregroundColor(.black)
                
                Text("≈ $0.00")
                    .foregroundColor(.gray)
                    .font(.caption)
            }
        }
        .padding(.vertical, 10)
        Divider().background(Color.gray.opacity(0.3))
    }
}
