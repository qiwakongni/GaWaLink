//
//  WalletView.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/07.
//

import SwiftUI

struct WalletView: View {
    
    @StateObject private var viewModel = WalletViewModel()
    @State private var showScanView = false
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                //top nav
                NavigationBarView(
                                walletName: viewModel.wallet.name,
                                address: viewModel.wallet.address,
                                onSwitchWallet: {
                                    print("切换钱包")
                                },
                                onScan: {
                                    showScanView = true
                                },
                                onMore: {
                                    print("更多")
                                }
                            )
                //middle wallet
                WalletHeaderView(wallet: viewModel.wallet)
                //bottom list
                HStack(spacing: 12) {
                    ActionButtonView(title: "转账", icon: "arrow.right.arrow.left")
                    ActionButtonView(title: "收款", icon: "qrcode")
                    ActionButtonView(title: "交易历史", icon: "doc.text")
                    ActionButtonView(title: "更多", icon: "square.grid.2x2")
                }
                
                AssetListView(assets: viewModel.wallet.assets)
                
                Spacer()
            }
            .padding()
            .background(Color.white)
            .navigationBarHidden(true)
            // ✅ ✅ ✅ 关键：这里就是扫码页跳转
            .fullScreenCover(isPresented: $showScanView) {
                ScanView()
            }
        }
    }
}

