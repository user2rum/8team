//
//  MenuRepository.swift
//  kiosk
//
//  Created by hong on 2023/07/25.
//

import Foundation

protocol MenuRepositoryProtocol {
    var selectedShop: ShopType { get set }
    var selectedCategory: Menu? { get set }
    func getShopList() -> [ShopType]?
    func getShopsMenus(_ type: ShopType) -> [Menu: [Menu]]?
    func getDetailCategory(_ menu: Menu) -> [Menu]?
    func setSelectedShop(_ shopType: ShopType)
    func setSelectedCategory(_ selctedCategory: Menu?)
}

final class MenuRepository: MenuRepositoryProtocol {
    
    private let provider: ShopAPIProvider
    var selectedShop: ShopType
    var selectedCategory: Menu?

    init(provider: ShopAPIProvider, selectedShop: ShopType, selectedCategory: Menu? = nil) {
        self.provider = provider
        self.selectedShop = selectedShop
        self.selectedCategory = selectedCategory
    }

    func getShopList() -> [ShopType]? {
        provider.get(.shopList, return: [ShopType].self)
    }
    
    func getShopsMenus(_ type: ShopType) -> [Menu: [Menu]]? {
        provider.get(.mainCategory(type), return: [Menu: [Menu]].self)
    }
    
    func getDetailCategory(_ menu: Menu) -> [Menu]? {
        guard let menus = getShopsMenus(selectedShop),
              let detailMenus = menus[menu] else {return nil}
        return detailMenus
    }
    
    func setSelectedShop(_ shopType: ShopType) {
        selectedShop = shopType
    }
    
    func setSelectedCategory(_ selctedCategory: Menu?) {
        selectedCategory = selctedCategory
    }
}

