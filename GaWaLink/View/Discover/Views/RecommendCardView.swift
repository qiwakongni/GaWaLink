//
//  RecommendCardView.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/10.
//

import SwiftUI

struct RecommendCardView: View {
    
    let item: DiscoverItemModel
    
    var body: some View {
        HStack(spacing: 12) {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 90)
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(item.tag)
                    .font(.caption)
                    .padding(4)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                
                Text(item.title)
                    .font(.headline)
                
                Text(item.subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
    }
}

