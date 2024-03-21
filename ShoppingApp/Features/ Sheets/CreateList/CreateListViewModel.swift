//
//  CreateListViewModel.swift
//  ShoppingApp
//
//  Created by Василий on 20.03.2024.
//

import Foundation

extension CreateListView {
    @MainActor
    final class ViewModel: ObservableObject {

        // MARK: - Properties

        @Published var newListName: String = ""
    }
}
