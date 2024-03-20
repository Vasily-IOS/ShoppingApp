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

        // MARK: - Nested types

        enum TabBar {
            case main
            case settings
        }

        // MARK: - Properties

        @Published var isMainShows: Bool = true

        @Published var selectedFolderModelID: FolderModel.ID?

        private (set) var folderModel = FolderModel.model

        // MARK: - Initializers

        init() {
            selectedFolderModelID = FolderModel.model.first?.id
        }
    }
}
