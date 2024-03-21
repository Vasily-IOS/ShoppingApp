//
//  ContentView.swift
//  ShoppingApp
//
//  Created by Василий on 06.03.2024.
//

import SwiftUI

struct ContentView: View {

    // MARK: - Properties

    @StateObject private var coordinator = AppCoordinator()

    @StateObject private var onboardingService = OnboardingService.shared

    var body: some View {
        if onboardingService.isOnboardingShown {
            OnboardingShownView()
        } else {
           OnboardingNotShowedView()
        }
    }
}

#Preview {
    ContentView()
}
