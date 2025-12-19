//
//  SendView.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/07.
//

import SwiftUI

struct SendView: View {
    @StateObject private var viewModel = SendViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                TextField("接收地址", text: $viewModel.toAddress)
                    .textFieldStyle(.roundedBorder)

                TextField("金额 (ETH)", text: $viewModel.amount)
                    .textFieldStyle(.roundedBorder)

                PrimaryButton(title: "发送交易") {
                    viewModel.send()
                }

                Text(viewModel.status)
                    .foregroundColor(.gray)
            }
            .padding()
            .navigationTitle("发送交易")
        }
    }
}


#Preview {
    SendView()
}
