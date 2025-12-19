//
//  WalletHeaderView.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/09.
//

import SwiftUI

struct WalletHeaderView: View {
    
    let wallet: WalletModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text(wallet.name)
                .foregroundColor(.black)
                .font(.headline)
            
            Text("$ \(wallet.totalBalanceUSD, specifier: "%.2f")")
                .font(.largeTitle.bold())
                .foregroundColor(.black)
            
            HStack {
                Text("EVM: \(wallet.address)")
                    .foregroundColor(.black)
                    .font(.caption)
                
                Spacer()
                
                Image(systemName: "doc.on.doc")
                    .foregroundColor(.black)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.15))
        .cornerRadius(14)
    }
}
