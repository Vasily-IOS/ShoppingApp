//
//  MainViewModel.swift
//  ShoppingApp
//
//  Created by Василий on 19.03.2024.
//

import Foundation

extension MainView {
    @MainActor
    final class ViewModel: ObservableObject {

        // MARK: - Properties

        @Published var isMainShows: Bool = true

        @Published var selectedBaseFolderModelID: BaseFolderModel.ID?

        private (set) var folderModel = BaseFolderModel.model

        // MARK: - Initializers

        init() {
            selectedBaseFolderModelID = BaseFolderModel.model.first?.id
        }

        // MARK: - Instance methods

        func isFirstFolder() -> Bool {
            selectedBaseFolderModelID == folderModel.first?.id
        }
    }
}
