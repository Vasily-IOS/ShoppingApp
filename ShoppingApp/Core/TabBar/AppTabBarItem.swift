//
//  AppTabBarItem.swift
//  ShoppingApp
//
//  Created by Василий on 22.03.2024.
//

import Foundation

struct AppTabBarItem: Hashable {
    let selectedIcon: String
    var unselectedIcon: String
    let title: String
}

enum TabBarItem: Hashable {
    case main
    case settings

    var item: AppTabBarItem {
        switch self {
        case .main:
            AppTabBarItem(selectedIcon: "selectedList_icon",
                          unselectedIcon: "unselectedList_icon",
                          title: AssetString.myLists.rawValue)
        case .settings:
            AppTabBarItem(selectedIcon: "settingsSelected_icon",
                          unselectedIcon: "settingsNotSelected_icon",
                          title: AssetString.settings.rawValue)
        }
    }
}
