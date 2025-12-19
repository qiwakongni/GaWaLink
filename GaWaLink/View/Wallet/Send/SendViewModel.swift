//
//  SendViewModel.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/07.
//

import Foundation

final class SendViewModel: ObservableObject {
    @Published var toAddress: String = ""
    @Published var amount: String = ""
    @Published var status: String = "等待发送"

    private let txService = TransactionService()

    func send() {
        status = "发送中..."

        txService.sendTransaction(
            to: toAddress,
            amount: amount
        ) { result in
            DispatchQueue.main.async {
                self.status = result
            }
        }
    }
}
