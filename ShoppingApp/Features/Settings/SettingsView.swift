//
//  SettingsView.swift
//  ShoppingApp
//
//  Created by Василий on 22.03.2024.
//

import SwiftUI
import PhotosUI

struct SettingsView: View {

    // MARK: - Properties

    @AppStorage (Config.userNameKey.rawValue) var userName: String?

    @AppStorage (Config.avatarKey.rawValue) var avatar: Data?

    @State private var capturedImage: PhotosPickerItem?

    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    Spacer()
                    HStack {
                        PhotosPicker(
                            selection: $capturedImage,
                            photoLibrary: PHPhotoLibrary.shared()
                        ) {
                            if avatar == nil {
                                AssetImage.avatar.image
                            } else {
                                Image(uiImage: UIImage(data: avatar ?? Data()) ?? UIImage())
                                    .resizable()
                                    .frame(width: 55, height: 55)
                                    .cornerRadius(27.5)
                            }
                        }
                        Text("\(AssetString.hello.rawValue), \(userName ?? AssetString.friend.rawValue)!")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .padding(.bottom, 16)
                }
                .frame(height: geometry.size.height * 0.2)
                .background(Color(uiColor: .mainOrange))
                .onChange(of: capturedImage) { image in

                    image?.loadTransferable(type: Data.self) { result in
                        switch result {
                        case .success(let success):
                            avatar = success ?? Data()
                        case .failure(let failure):
                            debugPrint(failure)
                        }
                    }
                }

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

                VStack {
                    Spacer()
                    Rectangle()
                        .fill(Color(uiColor: .mainOrange))
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.25)
                        .cornerRadius(30)
                }
                .padding(.bottom)
//                .padding(.bottom, geometry.size.height * 0.15)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    SettingsView()
}
