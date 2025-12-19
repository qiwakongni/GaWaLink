//
//  AssetListView.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/09.
//

import SwiftUI

struct AssetListView: View {
    
    let assets: [AssetModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("资产")
                .foregroundColor(.white)
                .font(.headline)
            
            ForEach(assets) { asset in
                AssetRowView(asset: asset)
            }
        }
    }
}
