//
//  MainView.swift
//  ShoppingApp
//
//  Created by Василий on 19.03.2024.
//

import SwiftUI

struct OnboardingShownView: View {
    
    // MARK: - Properties

    @StateObject private var coordinator = AppCoordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(.main)
                .navigationDestination(for: AppCoordinator.Page.self) { page in
                    coordinator.build(page)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.build(sheet)
                        .presentationDetents([.fraction(0.3)])
                }
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    OnboardingShownView()
}
