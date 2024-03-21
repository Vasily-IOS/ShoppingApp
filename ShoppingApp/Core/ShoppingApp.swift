//
//  ShoppingApp.swift
//  ShoppingApp
//
//  Created by Василий on 06.03.2024.
//

import SwiftUI

@main
struct ShoppingApp: App {

    // MARK: - Properties

    @State private var isCanHideSplash: Bool = false

    var body: some Scene {
        WindowGroup {
            if isCanHideSplash {
                ContentView()
            } else {
                SplashScreen(isCanHide: $isCanHideSplash)
            }
        }
    }
}
