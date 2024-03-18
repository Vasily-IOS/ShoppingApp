//
//  AppCoordinator.swift
//  ShoppingApp
//
//  Created by Василий on 18.03.2024.
//

import SwiftUI

final class AppCoordinator: ObservableObject {

    // MARK: - Nested Types

    enum Page: Identifiable, Hashable {
        case enterName
        case onboarding(userName: String)
        case main

        var id: String {
            UUID().uuidString
        }
    }

    enum Sheet: Identifiable {

        var id: String {
            UUID().uuidString
        }
    }

    // MARK: - Properties

    @Published var path = NavigationPath()

    @Published var sheet: Sheet?

    // MARK: - Instance methods

    func push(_ page: Page) {
        self.path.append(page)
    }

    func present(_ sheet: Sheet) {
        self.sheet = sheet
    }

    func pop(count: Int = 1) {
        self.path.removeLast(count)
    }

    func popToRoot() {
        self.path.removeLast(path.count)
    }

    func dismissSheet() {
        self.sheet = nil
    }

    @ViewBuilder
    func build(_ page: Page) -> some View {
        switch page {
        case .enterName:
            EnterNameView()
        case .onboarding(let userName):
            OnboardingView(userName: userName)
        case .main:
            MainView()
        }
    }

//    @ViewBuilder
//    func build(_ page: Sheet) -> some View {
//        switch page {
//        default:
//            OnboardingView()
//        }
//    }
}
