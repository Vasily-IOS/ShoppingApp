//
//  AssetImage.swift
//  ShoppingApp
//
//  Created by Василий on 18.03.2024.
//

import SwiftUI

enum AssetImage {
    case splash
    case logoOnTop
    case onboardingOne
    case onboardingTwo
    case onboardingThree
    case selectedLists
    case unselectedLists
    case selectedSettings
    case unselectesdSetting
    case addFolder
    case emptyList
    case favoriteList
    case avatar
    case rightArrow

    var image: Image {
        switch self {
        case .splash:
            return Image("splash_icon")
        case .logoOnTop:
            return Image("logoOnTop_icon")
        case .onboardingOne:
            return Image("onbStepOne_icon")
        case .onboardingTwo:
            return Image("onbStepTwo_icon")
        case .onboardingThree:
            return Image("onbStepThree_icon")
        case .selectedLists:
            return Image("selectesList_icon")
        case .unselectedLists:
            return Image("unselectedList_icon")
        case .selectedSettings:
            return Image("settingsSelected_icon")
        case .unselectesdSetting:
            return Image("settingsNotSelected_icon")
        case .addFolder:
            return Image("addFolder_icon")
        case .emptyList:
            return Image("emptyList_icon")
        case .favoriteList:
            return Image("favoriteList_icon")
        case .avatar:
            return Image("avatar_icon")
        case .rightArrow:
            return Image("rightArrow_icon")
        }
    }
}
