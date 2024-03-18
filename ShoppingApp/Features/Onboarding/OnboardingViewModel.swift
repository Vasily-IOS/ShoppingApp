//
//  OnboardingViewModel.swift
//  ShoppingApp
//
//  Created by Василий on 18.03.2024.
//

import Foundation

extension OnboardingView {
    @MainActor
    final class ViewModel: ObservableObject {
        
        // MARK: - Properties
        
        private (set) var pages = OnboardingModel.model
        
        @Published var pageIndex = 0

        @Published var userName: String?

        // MARK: - Instance methods

        func isLastPage() -> Bool {
            pages.last?.tag == pageIndex
        }

        func saveViewedOnboardingState() {
            if let userName = userName {
                OnboardingService.shared.save(name: userName)
            }
        }
    }
}
