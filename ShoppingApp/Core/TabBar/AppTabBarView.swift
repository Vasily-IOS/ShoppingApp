//
//  AppTabBarView.swift
//  ShoppingApp
//
//  Created by Василий on 22.03.2024.
//

import SwiftUI

struct AppTabBarView: View {

    // MARK: - Properties

    let tabs: [AppTabBarItem]

    @Binding var selection: AppTabBarItem

    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(.white)
        .clipShape(
            .rect(
                topLeadingRadius: 30,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: 30
            )
        )
        .shadow(radius: 10)
        .mask(Rectangle().padding(.top, -20))
        .ignoresSafeArea(edges: .bottom)
    }
}

extension AppTabBarView {
    func tabView(tab: AppTabBarItem) -> some View {
        VStack {
            Image(tab == selection ? tab.selectedIcon : tab.unselectedIcon)
            Text(tab.title)
                .font(.system(size: 12, weight: .thin))
        }
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
    }

    private func switchToTab(tab: AppTabBarItem) {
        selection = tab
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static let model: [AppTabBarItem] = [
        .init(selectedIcon: "person", unselectedIcon: "", title: "Profile"),
        .init(selectedIcon: "house", unselectedIcon: "", title: "Home")
    ]
    static var previews: some View {
        VStack {
            Spacer()
            AppTabBarView(tabs: model, selection: .constant(model.first!))
        }
    }
}
