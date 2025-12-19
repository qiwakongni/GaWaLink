//
//  DiscoverFeedCardView.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/10.
//

import SwiftUI

struct DiscoverFeedCardView: View {
    
    let item: DiscoverItemModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 180)
                .cornerRadius(16)
            
            Text(item.title)
                .font(.headline)
            
            Text(item.subtitle)
                .font(.caption)
                .foregroundColor(.gray)
            
            HStack {
                Text(item.tag)
                    .font(.caption)
                    .padding(6)
                    .background(Color.green)
                    .cornerRadius(8)
                
                Spacer()
                
                Label("\(item.likes)", systemImage: "heart")
                Label("\(item.favorites)", systemImage: "star")
            }
            .font(.caption)
            .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

