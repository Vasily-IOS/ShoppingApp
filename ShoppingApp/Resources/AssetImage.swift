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
    case pageOne
    case pageTwo
    case pageThree

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
        case .pageOne:
            return Image("pageOne_icon")
        case .pageTwo:
            return Image("pageTwo_icon")
        case .pageThree:
            return Image("pageThree_icon")
        }
    }
}
