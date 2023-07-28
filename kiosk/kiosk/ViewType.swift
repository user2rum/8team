//
//  ViewType.swift
//  kiosk
//
//  Created by hong on 2023/07/25.
//

import Foundation

enum ViewType {
    case `init`(_ menuRepository: MenuRepositoryProtocol)
    case mainMenu(_ menuRepository: MenuRepositoryProtocol, _ orderRepository: OrderRepositoryProtocol)
    case detailMenu(_ menuRepository: MenuRepositoryProtocol)
    case endProgram
    case selectedMenu(_ orderRepository: OrderRepositoryProtocol)
    case shoppingCart(_ OrderRepository: OrderRepositoryProtocol)
    case other(_ text: String)
}

extension ViewType {
    var viewController: CLViewController {
        switch self {
        case let .`init`(menuRepository):
            return InitViewController(menuRepository: menuRepository)
        case let .mainMenu(menuRepository, orderRepository):
            return MainMenuViewController(menuRepository: menuRepository, orderRepository: orderRepository)
        case let .detailMenu(menuRepository):
            return DetailMenuViewController(menuRepository: menuRepository)
        case .endProgram:
            return SingleLineViewController(singleLine: "프로그램을 종료합니다.")
        case let .selectedMenu(orderRepository):
            return SelectedMenuViewController(orderRepository: orderRepository)
        case let .shoppingCart(orderRepository):
            return ShoppingCartViewController(orderRepository: orderRepository)
        case .other(let text):
            return SingleLineViewController(singleLine: text)
        }
    }
}
