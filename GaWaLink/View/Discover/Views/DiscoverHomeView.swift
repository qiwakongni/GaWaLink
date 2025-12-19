//
//  DiscoverHomeView.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/10.
//

import SwiftUI

struct DiscoverHomeView: View {
    
    @StateObject private var viewModel = DiscoverViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            
            // ✅ 顶部搜索栏
            DiscoverSearchBarView()
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    // ✅ 推荐卡片
//                    if let item = viewModel.recommendItem {
//                        RecommendCardView(item: item)
//                    }
//                    
//                    // ✅ 分类九宫格
//                    CategoryGridView(categories: viewModel.categories)
//                    
//                    // ✅ Tab 筛选
//                    FilterTabBarView()
//                    
//                    // ✅ 信息流
//                    ForEach(viewModel.feeds) { item in
//                        DiscoverFeedCardView(item: item)
//                    }
                }
                .padding(.horizontal)
            }
            
            Spacer(minLength: 10)
            
            // ✅ 中间发布按钮
            Button {
                print("发布内容")
            } label: {
                Image(systemName: "heart.circle.fill")
                    .font(.system(size: 46))
                    .foregroundColor(.pink)
            }
            .padding(.bottom, 10)
        }
        .background(Color(.systemGray6))
    }
}
