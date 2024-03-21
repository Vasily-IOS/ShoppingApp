//
//  PageControl.swift
//  ShoppingApp
//
//  Created by Василий on 19.03.2024.
//

import SwiftUI

struct PageControl: View {

    // MARK: - Properties

    var numberOfPages: Int

    @Binding var currentPage: Int

    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<numberOfPages, id: \.self) { page in
                Circle()
                    .fill(page == self.currentPage ? Color(uiColor: .mainOrange) : Color(uiColor: .orangeLight))
                    .frame(width: 12, height: 12)
            }
        }
    }
}
