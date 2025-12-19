//
//  CategoryGridView.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/10.
//

import SwiftUI

struct CategoryGridView: View {
    
    let categories: [DiscoverCategoryModel]
    
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(categories) { item in
                VStack(spacing: 6) {
                    Image(systemName: item.icon)
                        .font(.title3)
                    Text(item.title)
                        .font(.caption)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(14)
            }
        }
    }
}

