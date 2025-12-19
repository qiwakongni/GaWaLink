//
//  SettingsView.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/07.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Text("账号设置")
                Text("安全中心")
                Text("关于我们")
            }
            .navigationTitle("设置")
        }
    }
}


#Preview {
    SettingsView()
}
