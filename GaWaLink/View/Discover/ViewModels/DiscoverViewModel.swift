//
//  DiscoverViewModel.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/10.
//

import Foundation

final class DiscoverViewModel: ObservableObject {
    
    @Published var recommendItem: DiscoverItemModel?
    @Published var categories: [DiscoverCategoryModel] = []
    @Published var feeds: [DiscoverItemModel] = []
    
    init() {
        loadMockData()
    }
    
    func loadMockData() {
        recommendItem = DiscoverItemModel(
            title: "北海道・札幌味噌ラーメン",
            subtitle: "4.6 | 北海道 人气",
            imageName: "ramen",
            tag: "季节限定",
            likes: 0,
            favorites: 0
        )
        
        categories = [
            .init(title: "美食", icon: "fork.knife"),
            .init(title: "景点", icon: "building.columns"),
            .init(title: "购物", icon: "cart"),
            .init(title: "文化", icon: "book"),
            .init(title: "住宿", icon: "bed.double"),
            .init(title: "交通", icon: "tram")
        ]
        
        feeds = [
            .init(
                title: "北海道・ニセコ 雪の王国",
                subtitle: "粉雪和温泉的双重享受",
                imageName: "snow",
                tag: "滑雪",
                likes: 128,
                favorites: 56
            ),
            .init(
                title: "京都・古都の宿 松乃間",
                subtitle: "百年町家与露天温泉",
                imageName: "house",
                tag: "和宿",
                likes: 92,
                favorites: 47
            ),
            .init(
                title: "东京・筑地市场 寿司名店",
                subtitle: "鲜度极高的寿司体验",
                imageName: "sushi",
                tag: "寿司",
                likes: 210,
                favorites: 88
            )
        ]
    }
}
