//
//  AppTabBarItemPreferenceKey.swift
//  ShoppingApp
//
//  Created by Василий on 21.03.2024.
//

import SwiftUI

struct AppTabBarItemPreferenceKey: PreferenceKey {

    // MARK: - Properties

    static var defaultValue: [AppTabBarItem] = []

    static func reduce(value: inout [AppTabBarItem], nextValue: () -> [AppTabBarItem]) {
        value += nextValue()
    }
}
