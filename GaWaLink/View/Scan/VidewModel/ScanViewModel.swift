//
//  ScanViewModel.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/09.
//

import Foundation

final class ScanViewModel: ObservableObject {
    
    @Published var scanResult: String? = nil
    @Published var walletConnectConnected = false
    
    func handleScan(result: String) {
        scanResult = result
        
        if result.lowercased().contains("wc") {
            walletConnectConnected = true
            print("✅ WalletConnect 链接成功: \(result)")
        } else {
            print("✅ 普通二维码: \(result)")
        }
    }
}
