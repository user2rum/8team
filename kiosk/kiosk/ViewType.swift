//
//  ViewType.swift
//  kiosk
//
//  Created by hong on 2023/07/25.
//

import Foundation

enum ViewType {
    case mainMenu
    case burgerMenu
    case frozenCustard
    case drinks
    case bear
    case endProgram
    case other(_ text: String)
}

extension ViewType {
    var viewController: CLViewController {
        switch self {
        case .mainMenu:
            return MainMenuViewController()
        case .burgerMenu:
            return BurgerMenuViewController()
        case .frozenCustard:
            return BurgerMenuViewController()
        case .drinks:
            return BurgerMenuViewController()
        case .bear:
            return BurgerMenuViewController()
        case .endProgram:
            return SingleLineViewController(singleLine: "프로그램을 종료합니다.")
        case .other(let text):
            return SingleLineViewController(singleLine: text)
        }
    }
}
