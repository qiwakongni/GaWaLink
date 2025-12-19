//
//  WalletAddressRowView.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/09.
//

import SwiftUI

struct WalletAddressRowView: View {
    
    let address: String
    
    var body: some View {
        HStack {
            
            Text("EVM: \(address)")
                .foregroundColor(.gray)
                .font(.caption)
            
            Spacer()
            
            Button {
                UIPasteboard.general.string = address
            } label: {
                Image(systemName: "doc.on.doc")
                    .foregroundColor(.black)
                    .font(.caption)
            }
            
            Button {
                print("点击更多")
            } label: {
                Image(systemName: "ellipsis")
                    .foregroundColor(.black)
            }
        }
    }
}
