//
//  MenuProvider.swift
//  kiosk
//
//  Created by hong on 2023/07/26.
//

import Foundation

protocol ShopAPIProviderProtocol {
    associatedtype Action
    func get<T>(_ action: ShopAPIProvider.Action, return type: T.Type) -> T?
}

final class ShopAPIProvider: ShopAPIProviderProtocol {
    private var shopList = ShopType.allCases
    private var menuDictionary: [ShopType: [Menu: [Menu]]] = [:]
    
    init() {
        // shake shack burger menuDictionary
        var shakeShackMenuDictionary: [Menu: [Menu]] = [:]
        for shakeShackMenu in ShakeShakBurgerMenuType.allCases {
            switch shakeShackMenu {
            case .burger:
                shakeShackMenuDictionary[shakeShackMenu.instance] = Burger.allCases.map { $0.instance }
            case .beer:
                shakeShackMenuDictionary[shakeShackMenu.instance] = Beer.allCases.map { $0.instance }
            case .drink:
                shakeShackMenuDictionary[shakeShackMenu.instance] = Drink.allCases.map { $0.instance }
            case .frozenCustard:
                shakeShackMenuDictionary[shakeShackMenu.instance] = FrozenCustard.allCases.map { $0.instance }
            }
        }
        menuDictionary[.shakeShackBurger] = shakeShackMenuDictionary
        
        // Lotteria menu
        var lotteriaMenuDictionary: [Menu: [Menu]] = [:]
        for lotteriaMenu in LotteriaMenuType.allCases {
            switch lotteriaMenu {
            case .burger:
                lotteriaMenuDictionary[lotteriaMenu.instance] = LotteriaBurger.allCases.map { $0.instance }
            case .chicken:
                lotteriaMenuDictionary[lotteriaMenu.instance] = LotteriaChicken.allCases.map { $0.instance }
            case .dessert:
                lotteriaMenuDictionary[lotteriaMenu.instance] = LotteriaDessert.allCases.map { $0.instance }
            case .drink:
                lotteriaMenuDictionary[lotteriaMenu.instance] = LotteriaDrink.allCases.map { $0.instance }
            }
        }
        menuDictionary[.lotteria] = lotteriaMenuDictionary
    }
    
    enum Action {
        case shopList
        case mainCategory(_ shopType: ShopType)
        
        var description: ShopType? {
            switch self {
            case let .mainCategory(shopType):
                return shopType
            default:
                return nil
            }
        }
    }
    func get<T>(_ action: Action, return type: T.Type) -> T? {
        switch action {
        case .shopList:
            return shopList as? T
        case .mainCategory:
            guard let shopType = action.description,
                  let mainCategorys = menuDictionary[shopType] else {return nil}
            return mainCategorys as? T
        }
    }

}
