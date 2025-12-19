//
//  FilterTabBarView.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/10.
//

import SwiftUI

struct FilterTabBarView: View {
    
    @State private var selected = 0
    let tabs = ["最新", "人气", "附近", "收藏"]
    
    var body: some View {
        HStack {
            ForEach(tabs.indices, id: \.self) { index in
                Button {
                    selected = index
                } label: {
                    Text(tabs[index])
                        .foregroundColor(selected == index ? .white : .black)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 6)
                        .background(selected == index ? Color.black : Color.clear)
                        .cornerRadius(12)
                }
            }
            Spacer()
        }
    }
}
