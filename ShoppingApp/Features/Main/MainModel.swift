//
//  MainModel.swift
//  ShoppingApp
//
//  Created by Василий on 19.03.2024.
//

import SwiftUI

struct BaseFolderModel: Identifiable {
    var id = UUID()
    var name: String

    static let model: [Self] = [
        .init(name: AssetString.all.rawValue),
        .init(name: AssetString.favourites.rawValue)
    ]
}
