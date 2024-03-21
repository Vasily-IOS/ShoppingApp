//
//  EnterNameView.swift
//  ShoppingApp
//
//  Created by Василий on 18.03.2024.
//

import SwiftUI

struct EnterNameView: View {

    // MARK: - Properties

    @StateObject private var viewModel = ViewModel()

    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        VStack(alignment: .center, spacing: 60) {
            AssetImage.logoOnTop.image

            VStack(alignment: .leading, spacing: 30) {
                Text(AssetString.greeting.rawValue)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)

                VStack(spacing: 10) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(AssetString.whatIsYourName.rawValue)
                            .foregroundColor(.white)
                            .font(.system(size: 12))

                        TextField(AssetString.enterName.rawValue, text: $viewModel.name)
                            .keyboardType(.default)
                            .padding(16)
                            .background(.white)
                            .cornerRadius(10)
//                            .frame(height: 56)
                    }

                    Button {
                        if viewModel.isCanContinue() {
                            viewModel.isAlertPresented = true
                        } else {
                            coordinator.push(.onboarding(userName: viewModel.name))
                        }
                    } label: {
                        HStack {
                            Spacer()
                            Text(AssetString.go.rawValue)
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .frame(height: 56)
                            Spacer()
                        }
                        .background(Color(uiColor: .mainBlue))
                        .cornerRadius(10)
                    }
                    .alert(isPresented: $viewModel.isAlertPresented) {
                        Alert(title: Text(AssetString.enterNamePls.rawValue))
                    }
                }

                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(Color(uiColor: .mainOrange))
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    EnterNameView()
}
