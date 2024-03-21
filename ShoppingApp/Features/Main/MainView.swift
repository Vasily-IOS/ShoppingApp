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
            // Главный экран
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
                    .hidden(!viewModel.isMainShows)

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
                    .frame(height: geo.size.height * 0.1)
                }
                .edgesIgnoringSafeArea(.bottom)
                .padding(.top, 30)
            }

            // Экран настроек
            GeometryReader { geometry in
                VStack {
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

                    Button {
                        print("Go to settings")
                    } label: {
                        HStack {
                            Color.white
                                .overlay {
                                    HStack {
                                        Text(AssetString.appLanguage.rawValue)
                                            .foregroundColor(.black)
                                            .font(.system(size: 20, weight: .light))
                                        Spacer()
                                        AssetImage.rightArrow.image
                                    }
                                    .padding(.horizontal, 16)
                                }
                        }
                        .frame(height: 50)
                        .cornerRadius(10)
                        .padding(.horizontal, 16)
                        .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 0)
                        .clipShape(
                            .rect(
                                topLeadingRadius: 0,
                                bottomLeadingRadius: 0,
                                bottomTrailingRadius: 0,
                                topTrailingRadius: 0
                            )
                        )
                    }
                    .padding(.top)

                    Button {
                        print("Go to about app screen")
                    } label: {
                        HStack {
                            Color.white
                                .overlay {
                                    HStack {
                                        Text(AssetString.aboutApp.rawValue)
                                            .foregroundColor(.black)
                                            .font(.system(size: 20, weight: .light))
                                        Spacer()
                                        AssetImage.rightArrow.image
                                    }
                                    .padding(.horizontal, 16)
                                }
                        }
                        .frame(height: 50)
                        .cornerRadius(10)
                        .padding(.horizontal, 16)
                        .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 0)
                        .clipShape(
                            .rect(
                                topLeadingRadius: 0,
                                bottomLeadingRadius: 0,
                                bottomTrailingRadius: 0,
                                topTrailingRadius: 0
                            )
                        )
                    }
                    .padding(.top, 0)

                    VStack {
                        Spacer()
                        Rectangle()
                            .fill(Color(uiColor: .mainOrange))
                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.25)
                            .cornerRadius(30)
                    }
                    .padding(.bottom, geometry.size.height * 0.15)
                }
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
