//
//  SplashScreen.swift
//  ShoppingApp
//
//  Created by Василий on 18.03.2024.
//

import SwiftUI

struct SplashScreen: View {

    // MARK: - Properties

    @Binding var isCanHide: Bool

    var body: some View {
        VStack {
            Spacer()
            AssetImage.splash.image
                .padding(.horizontal)
                .background(Color(uiColor: .mainOrange))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.isCanHide = true
                    }
                }
            Spacer()
        }
        .padding(.horizontal)
        .background(Color(uiColor: .mainOrange))
        .ignoresSafeArea()
    }
}
