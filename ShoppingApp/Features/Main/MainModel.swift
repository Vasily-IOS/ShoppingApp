//
//  MainModel.swift
//  ShoppingApp
//
//  Created by Василий on 19.03.2024.
//

import SwiftUI

struct FolderModel: Identifiable {
    var id = UUID()
    var name: String
    var emptyFolderImage: Image?

    static let model: [Self] = [
        .init(name: "Все"),
        .init(name: "Избранное")
    ]
}
