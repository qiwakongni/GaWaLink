//
//  ScanTopBarView.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/09.
//

import SwiftUI

struct ScanTopBarView: View {
    
    var onClose: () -> Void
    var onAlbum: () -> Void
    
    var body: some View {
        HStack {
            Button(action: onClose) {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
                    .font(.title3)
            }
            
            Spacer()
            
            Text("扫描二维码")
                .font(.headline)
            
            Spacer()
            
            Button(action: onAlbum) {
                Text("相册")
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}
