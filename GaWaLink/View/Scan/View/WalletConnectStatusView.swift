//
//  WalletConnectStatusView.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/09.
//

import SwiftUI

struct WalletConnectStatusView: View {
    
    let connected: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Image(systemName: "link")
                    .foregroundColor(.blue)
                Text("WalletConnect")
                    .font(.headline)
                Spacer()
                Text(connected ? "已连接" : "无连接")
                    .foregroundColor(connected ? .green : .gray)
            }
            
            Button("如何连接 >") {
                print("跳转 WalletConnect 教程")
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(14)
        .shadow(radius: 4)
        .padding(.horizontal)
    }
}
