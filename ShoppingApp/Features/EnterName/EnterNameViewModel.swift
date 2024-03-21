//
//  EnterNameViewModel.swift
//  ShoppingApp
//
//  Created by Василий on 18.03.2024.
//

import Foundation

extension EnterNameView {
    @MainActor
    final class ViewModel: ObservableObject {

        // MARK: - Properties

        @Published var name: String = ""

        @Published var isAlertPresented: Bool = false

        // MARK: - Instance methods

        func isCanContinue() -> Bool {
            name.isEmpty || name.trimmingCharacters(in: .whitespaces).isEmpty
        }
    }
}
