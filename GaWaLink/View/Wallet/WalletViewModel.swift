//
//  WalletViewModel.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/07.
//

import Foundation
import Combine

final class WalletViewModel: ObservableObject {
    
    @Published var wallet: WalletModel
    
    init() {
        self.wallet = WalletModel(
            name: "钱包1 - Account 1",
            address: "0xFEA97f...dF2f3c3f73C61",
            totalBalanceUSD: 0,
            assets: [
                AssetModel(symbol: "BNB", name: "BNB", priceUSD: 886.7907, balance: 0, chain: .bsc),
                AssetModel(symbol: "USDT", name: "USDT", priceUSD: 1.00002, balance: 0, chain: .bsc),
                AssetModel(symbol: "ETH", name: "Ethereum", priceUSD: 3104.8643, balance: 0, chain: .ethereum),
                AssetModel(symbol: "TRX", name: "TRON", priceUSD: 0.2806, balance: 0, chain: .tron)
            ]
        )
    }
    
    func refreshData() {
        // ✅ 之后接 API / Web3 / 钱包 RPC 就在这里更新
        print("刷新资产数据")
    }
}
