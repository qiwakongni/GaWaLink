//
//  ScanView.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/09.
//

import SwiftUI

struct ScanView: View {
    
    @StateObject private var viewModel = ScanViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            
            Color(.systemGray5).ignoresSafeArea()
            
            VStack {
                
                // ✅ 顶部导航
                ScanTopBarView(
                    onClose: { dismiss() },
                    onAlbum: { print("打开相册") }
                )
                
                // ✅ 扫码框区域
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.black.opacity(0.05))
                        .frame(height: 320)
                    
                    QRScannerView { result in
                        viewModel.handleScan(result: result)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .padding()
                
                // ✅ 说明文案
                VStack(alignment: .leading, spacing: 10) {
                    Label("扫描地址代码来发送资金。", systemImage: "diamond")
                    Label("在移动App端通过WalletConnect以连接到DApp。", systemImage: "wave.3.right")
                    Label("在您的电脑端DApp上扫描WalletConnect二维码连接到网页。", systemImage: "desktopcomputer")
                }
                .font(.subheadline)
                .padding()
                
                Spacer()
                
                // ✅ WalletConnect 状态块
                WalletConnectStatusView(connected: viewModel.walletConnectConnected)
                
                Spacer(minLength: 10)
            }
        }
    }
}
