//
//  MyView.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/07.
//

import SwiftUI

//struct MyView: View {
//    var body: some View {
//        Text("Hello, MyView!")
//    }
//}
//
//#Preview {
//    MyView()
//}

import SwiftUI

struct MyView: View {
    var body: some View {
        NavigationStack {
            List {
                // 第一组
                Section {
                    NavigationLink {
                        PlaceholderView(title: "钱包管理")
                    } label: {
                        SettingRow(
                            icon: .system("wallet.pass"),
                            title: "钱包管理",
                            subtitle: "5 个账户"
                        )
                    }

                    NavigationLink {
                        PlaceholderView(title: "地址本")
                    } label: {
                        SettingRow(icon: .system("person.text.rectangle"), title: "地址本")
                    }

                    NavigationLink {
                        PlaceholderView(title: "区块链网络")
                    } label: {
                        SettingRow(icon: .system("square.dashed"), title: "区块链网络")
                    }

                    NavigationLink {
                        PlaceholderView(title: "使用设置")
                    } label: {
                        SettingRow(icon: .system("gearshape"), title: "使用设置")
                    }
                }

                // 第二组
                Section {
                    NavigationLink {
                        PlaceholderView(title: "帮助与反馈")
                    } label: {
                        SettingRow(icon: .system("doc.text"), title: "帮助与反馈")
                    }

                    NavigationLink {
                        PlaceholderView(title: "钱包指南")
                    } label: {
                        SettingRow(icon: .system("book"), title: "钱包指南")
                    }

                    NavigationLink {
                        PlaceholderView(title: "用户协议")
                    } label: {
                        SettingRow(icon: .system("checkmark.seal"), title: "用户协议")
                    }

                    NavigationLink {
                        PlaceholderView(title: "关于我们")
                    } label: {
                        SettingRow(icon: .system("house"), title: "关于我们")
                    }
                }
            }
            .listStyle(.insetGrouped)
            .scrollContentBackground(.hidden)      // 背景更接近截图的“浅灰”
            .background(Color(.systemGroupedBackground))
            .navigationTitle("我")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // TODO: 通知页
                    } label: {
                        Image(systemName: "bell")
                    }
                }
            }
        }
    }
}

// MARK: - Row
struct SettingRow: View {
    enum Icon {
        case system(String)
        case asset(String)

        @ViewBuilder var view: some View {
            switch self {
            case .system(let name):
                Image(systemName: name)
            case .asset(let name):
                Image(name)
            }
        }
    }

    let icon: Icon
    let title: String
    var subtitle: String? = nil

    var body: some View {
        HStack(spacing: 14) {
            icon.view
                .font(.system(size: 18))
                .frame(width: 22, height: 22)
                .foregroundStyle(.primary)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 17))
                    .foregroundStyle(.primary)

                if let subtitle {
                    Text(subtitle)
                        .font(.system(size: 13))
                        .foregroundStyle(.secondary)
                }
            }

            Spacer()

//            Image(systemName: "chevron.right")
//                .font(.system(size: 14, weight: .semibold))
//                .foregroundStyle(.tertiary)
        }
        .padding(.vertical, 6)
        .contentShape(Rectangle())
    }
}

// MARK: - Placeholder
private struct PlaceholderView: View {
    let title: String
    var body: some View {
        Text(title)
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MyView()
}
