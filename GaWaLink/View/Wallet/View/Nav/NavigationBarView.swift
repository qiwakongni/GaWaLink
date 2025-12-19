//
//  NavigationBarView.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/09.
//

import SwiftUI

struct NavigationBarView: View {
    
    let walletName: String
    let address: String
    
    var onSwitchWallet: () -> Void
    var onScan: () -> Void
    var onMore: () -> Void
    
    var body: some View {
        VStack(spacing: 12) {
            
            // ✅ 顶部主行
            HStack {
                
                // 左：钱包头像
                Circle()
                    .fill(Color.purple)
                    .frame(width: 36, height: 36)
                    .overlay(
                        Image(systemName: "bitcoinsign.circle.fill")
                            .foregroundColor(.black)
                    )
                
                // 中：钱包名 + 下拉
                Button(action: onSwitchWallet) {
                    HStack(spacing: 4) {
                        Text(walletName)
                            .foregroundColor(.black)
                            .font(.headline)
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                }
                
                Spacer()
                
                // 右：扫一扫
                Button(action: onScan) {
                    Image(systemName: "qrcode.viewfinder")
                        .foregroundColor(.black)
                        .font(.title3)
                }
            }
            
            // ✅ 地址行
            WalletAddressRowView(address: address)
        }
        .padding(.horizontal)
        .padding(.top, 8)
    }
}
