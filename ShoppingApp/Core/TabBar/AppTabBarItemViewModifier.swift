//
//  AppTabBarItemViewModifier.swift
//  ShoppingApp
//
//  Created by Василий on 22.03.2024.
//

import SwiftUI

struct AppTabBarItemViewModifier: ViewModifier {

    // MARK: - Properties

    let tab: AppTabBarItem

    @Binding var selection: AppTabBarItem

    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1.0 : 0.0)
            .preference(key: AppTabBarItemPreferenceKey.self, value: [tab])
    }
}

extension View {
    func tabBarItem(tab: AppTabBarItem, selection: Binding<AppTabBarItem>) -> some View {
        modifier(AppTabBarItemViewModifier(tab: tab, selection: selection))
    }
}
