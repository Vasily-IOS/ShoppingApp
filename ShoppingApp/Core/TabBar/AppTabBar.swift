//
//  AppTabBar.swift
//  ShoppingApp
//
//  Created by Василий on 21.03.2024.
//

import SwiftUI

struct AppTabBar: View {

    // MARK: - Properties

    @State private var tabSelection: AppTabBarItem = TabBarItem.main.item

    var body: some View {
        AppTabBarContainerView(selection: $tabSelection) {
            MainView()
                .tabBarItem(tab: TabBarItem.main.item, selection: $tabSelection)
            SettingsView()
                .tabBarItem(tab: TabBarItem.settings.item, selection: $tabSelection)
        }
    }
}

struct AppTabBar_Previews: PreviewProvider {
    static let model: [AppTabBarItem] = [
        .init(selectedIcon: "person", unselectedIcon: "", title: "Profile"),
        .init(selectedIcon: "house", unselectedIcon: "", title: "Home")
    ]
    static var previews: some View {
        AppTabBar()
    }
}
