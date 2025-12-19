//
//  DiscoverItemModel.swift
//  GaWaLink
//
//  Created by watashi on 2025/12/10.
//

import Foundation

struct DiscoverItemModel: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
    let tag: String
    let likes: Int
    let favorites: Int
}
