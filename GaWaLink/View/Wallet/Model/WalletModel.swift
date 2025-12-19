//
//  WalletModel.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/09.
//

import Foundation

struct WalletModel: Codable {
    let name: String
    let address: String
    let totalBalanceUSD: Double
    let assets: [AssetModel]
}
