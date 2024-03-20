//
//  CreateListView.swift
//  ShoppingApp
//
//  Created by Василий on 20.03.2024.
//

import SwiftUI

struct CreateListView: View {

    // MARK: - Properties

    @StateObject private var viewModel = ViewModel()

    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        VStack {
            Text(AssetString.newList.rawValue)
                .font(.system(size: 20, weight: .medium))

            
            TextField("", text: $viewModel.newListName, prompt: Text(AssetString.listNamе.rawValue)
                .font(.system(size: 16)))
                .padding(.horizontal, 16)

            Rectangle()
                .frame(height: 1)
                .padding(.horizontal, 16)

            HStack {
                Button {
                    coordinator.dismissSheet()
                } label: {
                    Text(AssetString.cancel.rawValue)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                }
                .padding(.leading, 40)

                Spacer()

                Button {
                    print("Сохранить")
                } label: {
                    HStack {
                        Spacer()
                        Text(AssetString.save.rawValue)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.vertical, 5)
                        Spacer()
                    }
                    .background(Color(uiColor: .mainOrange))
                    .cornerRadius(30)
                    .frame(width: 165, height: 44)
                }
                .padding(.trailing, 40)
            }

            Spacer()
        }
        .padding(.top, 20)
    }

}

#Preview {
    CreateListView()
}
