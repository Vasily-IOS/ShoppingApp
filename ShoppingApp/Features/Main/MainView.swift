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

    @AppStorage (Config.userNameKey.rawValue) var userName: String?

    var body: some View {
        ZStack {
            GeometryReader { geo in
                VStack(alignment: .center) {
                    HStack {
                        Text(AssetString.myLists.rawValue)
                            .font(.system(size: 24, weight: .bold))
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .hidden(!viewModel.isMainShows)

                    HStack {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(viewModel.folderModel) { folder in
                                    VStack(spacing: 5) {
                                        Text(folder.name)
                                            .font(.system(size: 20))
                                            .foregroundColor(viewModel.selectedFolderModelID == folder.id ? .black : .black.opacity(0.38))

                                        Rectangle()
                                            .frame(height: 1)
                                            .foregroundColor(viewModel.selectedFolderModelID == folder.id ? Color(uiColor: .mainOrange) : .clear)
                                    }
                                    .onTapGesture {
                                        viewModel.selectedFolderModelID = folder.id
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
                    .hidden(!viewModel.isMainShows)

                    VStack {
                        AssetImage.emptyList.image

                        Text(AssetString.youHaveNoListsYet.rawValue)
                            .font(.system(size: 24, weight: .bold))
                            .multilineTextAlignment(.center)
                        Text(AssetString.createListRightNow.rawValue)
                            .font(.system(size: 20, weight: .light))

                    }
                    .padding(.top, 40)
                    .hidden(!viewModel.isMainShows)

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
                    .hidden(!viewModel.isMainShows)

                    HStack {
                        VStack {
                            getTabBarView(tag: 0)
                            Text(AssetString.myLists.rawValue)
                                .font(.system(size: 12))
                        }
                        .padding(.leading, geo.size.width * 0.2)
                        .padding(.vertical)
                        .onTapGesture {
                            viewModel.isMainShows = true
                        }

                        Spacer()

                        VStack {
                            getTabBarView(tag: 1)
                            Text(AssetString.settings.rawValue)
                                .font(.system(size: 12))
                        }
                        .padding(.trailing, geo.size.width * 0.2)
                        .padding(.vertical)
                        .onTapGesture {
                            viewModel.isMainShows = false
                        }
                    }
                    .padding(.bottom)
                    .background(.white)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 30,
                            bottomLeadingRadius: 0,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: 30
                        )
                    )
                    .shadow(color: .black, radius: 5, x: 0, y: 5)
                }
                .edgesIgnoringSafeArea(.bottom)
                .padding(.top, 30)
            }

            GeometryReader { geometry in
                VStack {
                    Spacer()
                    HStack {
                        AssetImage.avatar.image
                        Text("Привет, \(userName ?? "Друг")!")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .padding(.bottom, 16)
                }
                .frame(height: geometry.size.height * 0.2)
                .background(Color(uiColor: .mainOrange))
            }
            .edgesIgnoringSafeArea(.top)
            .hidden(viewModel.isMainShows)
        }
    }

    // MARK: - Instance methods

    private func getTabBarView(tag: Int) -> some View {
        switch tag {
        case 0:
            viewModel.isMainShows ? AssetImage.selectedLists.image : AssetImage.unselectedLists.image
        default:
            viewModel.isMainShows ? AssetImage.unselectesdSetting.image : AssetImage.selectedSettings.image
        }
    }
}

#Preview {
    MainView()
}
