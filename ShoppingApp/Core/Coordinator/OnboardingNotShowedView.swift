//
//  EnterNameView.swift
//  ShoppingApp
//
//  Created by Василий on 19.03.2024.
//

import SwiftUI

struct OnboardingNotShowedView: View {

    // MARK: - Properties

    @StateObject private var coordinator = AppCoordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(.enterName)
                .navigationDestination(for: AppCoordinator.Page.self) { page in
                    coordinator.build(page)
                }
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    OnboardingNotShowedView()
}
