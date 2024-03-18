//
//  OnboardingView.swift
//  ShoppingApp
//
//  Created by Василий on 18.03.2024.
//

import SwiftUI

struct OnboardingView: View {

    // MARK: - Properties

    @EnvironmentObject var onboardingService: OnboardingService

    @StateObject private var viewModel = ViewModel()

    var userName: String

    var body: some View {
        VStack {
            PageControl(numberOfPages: viewModel.pages.count, currentPage: $viewModel.pageIndex)
                .padding(.top)
            TabView(selection: $viewModel.pageIndex) {
                ForEach(viewModel.pages) { page in
                    VStack {
                        Spacer()
                        OnboardingPageView(onboardingModel: page)
                        Spacer()

                        Button {
                            if !viewModel.isLastPage() {
                                viewModel.pageIndex += 1
                            } else {
                                viewModel.saveViewedOnboardingState()
                            }
                        } label: {
                            HStack {
                                Spacer()
                                Text(getBaseButtonTitle())
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .frame(height: 56)
                            .background(Color(uiColor: .mainOrange))
                            .cornerRadius(10)
                        }
                        .padding(.horizontal, 16)

                        Button {
                            viewModel.saveViewedOnboardingState()
                        } label: {
                            Text(getSkipButtonTitle())
                                .foregroundColor(viewModel.isLastPage() ? .clear : Color(uiColor: .customGray))
                        }
                        .padding(.top, 5)

                        Spacer()
                    }
                    .tag(page.tag)
                }
            }
            .navigationBarBackButtonHidden()
            .animation(.easeInOut, value: viewModel.pageIndex)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onAppear {
                viewModel.userName = userName
            }
        }
    }

    // MARK: - Instance methods

    private func getBaseButtonTitle() -> String {
        viewModel.isLastPage() ? AssetString.begin.rawValue : AssetString.continuee.rawValue
    }

    private func getSkipButtonTitle() -> String {
        viewModel.isLastPage() ? "белый текст" : AssetString.skip.rawValue
    }
}

#Preview {
    OnboardingView(userName: "ndndnd")
}
