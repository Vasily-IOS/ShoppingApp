//
//  MainView.swift
//  ShoppingApp
//
//  Created by Василий on 18.03.2024.
//

import SwiftUI

struct MainView: View {

    // MARK: - Properties

    @StateObject private var viewModel = ViewModel()

    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .center) {
                HStack {
                    Text(AssetString.myLists.rawValue)
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                }
                .padding(.leading, 16)

                HStack {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.folderModel) { folder in
                                VStack(spacing: 5) {
                                    Text(folder.name)
                                        .font(.system(size: 20))
                                        .foregroundColor(viewModel.selectedBaseFolderModelID == folder.id ? .black : .black.opacity(0.38))
                                        .padding(.horizontal, 5)

                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(viewModel.selectedBaseFolderModelID == folder.id ? Color(uiColor: .mainOrange) : .clear)
                                }
                                .onTapGesture {
                                    viewModel.selectedBaseFolderModelID = folder.id
                                }
                            }
                        }
                    }

                    Spacer()

                    Button {
                        coordinator.present(.createFolder)
                    } label: {
                        AssetImage.addFolder.image
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)

                VStack {
                    (viewModel.selectedBaseFolderModelID == viewModel.folderModel.first?.id) ? AssetImage.emptyList.image : AssetImage.favoriteList.image

                    ZStack {
                        Text(AssetString.haveNoFavouritesListsYet.rawValue)
                            .font(.system(size: 24, weight: .bold))
                            .multilineTextAlignment(.center)
                            .hidden(viewModel.isFirstFolder())
                            .padding(.horizontal, 16)

                        VStack {
                            Text(AssetString.youHaveNoListsYet.rawValue)
                                .font(.system(size: 24, weight: .bold))
                                .multilineTextAlignment(.center)
                            Text(AssetString.createListRightNow.rawValue)
                                .font(.system(size: 20, weight: .light))
                        }
                        .hidden(!viewModel.isFirstFolder())
                    }
                }
                .padding(.top, 40)

                Spacer()

                Button {
                    coordinator.present(.createList)
                } label: {
                    HStack {
                        Spacer()
                        Text(AssetString.createList.rawValue)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .padding(.vertical)

                        Spacer()
                    }
                    .background(Color(uiColor: .mainOrange))
                    .cornerRadius(16)
                    .padding(.horizontal, 16)
                    .padding(.bottom)
                }
            }
            .padding(.top, 30)
        }
    }
}

#Preview {
    MainView()
}
