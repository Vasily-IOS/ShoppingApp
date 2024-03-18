//
//  OnboardingService.swift
//  ShoppingApp
//
//  Created by Василий on 19.03.2024.
//

import Foundation

final class OnboardingService: ObservableObject {

    // MARK: - Properties

    @Published var isOnboardingShown: Bool = false

    static let shared = OnboardingService()

    // MARK: - Initializers

    private init() {
        isOnboardingShown = UserDefaults.standard.bool(forKey: Config.onboardingShownKey.rawValue)
    }

    func save(name: String) {
        isOnboardingShown = true
        UserDefaults.standard.setValue(name, forKey: Config.userNameKey.rawValue)
        UserDefaults.standard.set(true, forKey: Config.onboardingShownKey.rawValue)
    }
}
