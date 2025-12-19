//
//  NetworkManager.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/07.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()

    func requestMock(completion: @escaping (String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion("请求成功 ✅")
        }
    }
}

