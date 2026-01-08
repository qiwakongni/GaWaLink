//
//  MainTabView.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/07.
//

import SwiftUI
/// 应用程序的主视图，包含 TabBar 和所有子视图

struct MainTabView: View {
    
    // 使用 @State 绑定当前选中的 Tab
    @State private var selectedTab = 0
    private let myButton = MyView()
    
    var body: some View {
        // TabView 是 SwiftUI 中创建 TabBar 的主要容器
        TabView(selection: $selectedTab) {
            
            // MARK: - 首页 Tab
            WalletView()
                .tabItem {
                    // 设置 Tab 的图标和文字
                    Label("ホーム", image: "tabbar_home")
                }
                .tag(0) // 必须设置唯一的 tag
            
            // MARK: - 圈子 Tab
            MarketView()
                .tabItem {
                    Label("市場動向", image: "tabbar_swap")
                }
                .tag(1)
            
            // MARK: - 消息 Tab
            ExchangeView()
                .tabItem {
                    Label("取引", image: "tabbar_dapp")
                }
                .tag(2)
            
            // MARK: - 我的 Tab
            MyView()
                .tabItem {
                    Label("マイページ", image: "tabbar_mine")
                }
                .tag(3)
        }
        //
        // 可以在这里设置 TabBar 的全局外观（如颜色，但通常系统默认即可）
        .accentColor(.blue) // 选中 Tab 的颜色
    }
}
