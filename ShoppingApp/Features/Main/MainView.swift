//
//  MainView.swift
//  ShoppingApp
//
//  Created by Василий on 18.03.2024.
//

import SwiftUI

struct MainView: View {

    // MARK: - Properties

    @AppStorage (Config.userNameKey.rawValue) var userName: String?

    var body: some View {
        Text("Hello, \(userName ?? "No name")!")
    }
}

#Preview {
    MainView()
}
