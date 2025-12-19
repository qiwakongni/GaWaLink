//
//  DiscoverSearchBarView.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/10.
//

import SwiftUI

struct DiscoverSearchBarView: View {
    
    @State private var keyword = ""
    
    var body: some View {
        HStack {
            TextField("旅日和", text: $keyword)
                .padding(10)
                .background(Color(.systemGray5))
                .cornerRadius(12)
            
            Image(systemName: "magnifyingglass")
            
            Spacer()
            
            Image(systemName: "person.circle")
                .font(.title2)
        }
        .padding(.horizontal)
        .padding(.top, 12)
    }
}

