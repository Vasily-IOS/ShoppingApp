//
//  AppTabBarContainerView.swift
//  ShoppingApp
//
//  Created by Василий on 21.03.2024.
//

import SwiftUI

struct AppTabBarContainerView<Content: View>: View {

    // MARK: - Properties

    @Binding var selection: AppTabBarItem

    let content: Content

    @State private var tabs: [AppTabBarItem] = []

    // MARK: - Initializers

    init(selection: Binding<AppTabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                content
                    .padding(.bottom, 6)
            }
            AppTabBarView(tabs: tabs, selection: $selection)
        }
        .onPreferenceChange(AppTabBarItemPreferenceKey.self, perform: { value in
            self.tabs = value
        })
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
    static let model: [AppTabBarItem] = [
        .init(selectedIcon: "person", unselectedIcon: "", title: "Profile"),
        .init(selectedIcon: "house", unselectedIcon: "", title: "Home")
    ]

    static var previews: some View {
        AppTabBarContainerView(selection: .constant(model.first!)) {
            Color.red
        }
    }
}
