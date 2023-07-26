//
//  Menu.swift
//  kiosk
//
//  Created by hong on 2023/07/25.
//

import Foundation

class Menu: Hashable, Equatable {
    
    private let name: String
    private let price: Double
    private let description: String
    private let image: String?
    
    init(name: String, price: Double, description: String, image: String? = nil) {
        self.name = name
        self.price = price
        self.description = description
        self.image = image
    }
    
    convenience init(name: String, description: String) {
        self.init(name: name, price: 0.0, description: description)
    }
    
    convenience init(name: String) {
        self.init(name: name, price: 0.0, description: "")
    }
    
    func displayInfo() -> String {
       return description
    }
    
    func displayName() -> String {
        return name
    }
    
    static func == (lhs: Menu, rhs: Menu) -> Bool {
        return lhs.name == rhs.name &&
        lhs.description == rhs.description &&
        lhs.price == rhs.price &&
        lhs.image == rhs.image
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(description)
        hasher.combine(price)
        hasher.combine(image)
    }
}

final class Burgers: Menu {}
final class FrozenCustards: Menu {}
final class Drinks: Menu {}
final class Beers: Menu {}


protocol MenuProtocol {
    var instance: Menu { get }
}

typealias DetailMenu = CaseIterable & MenuProtocol

enum ShakeShakBurgerMenuType: DetailMenu {
    case burger
    case frozenCustard
    case drink
    case beer
}

extension ShakeShakBurgerMenuType {
    var instance: Menu {
        switch self {
        case .burger:
            return Menu(name: "burger")
        case .frozenCustard:
            return Menu(name: "frozenCustard")
        case .drink:
            return Menu(name: "drink")
        case .beer:
            return Menu(name: "beer")
        }
    }
}

enum Burger: DetailMenu {
    case ShackBurger
    case SmokeShack
    case ShroomBurger
    case Cheeseburger
    case Hamburger
}

extension Burger {
    var instance: Menu {
        switch self {
        case .ShackBurger:
            return Burgers(name: "ShackBurger", price: 6.9, description: "토마토, 양상추, 쉑소스가 토핑된 치즈버거")
        case .SmokeShack:
            return Burgers(name: "SmokeShack", price: 8.9, description: "베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거")
        case .ShroomBurger:
            return Burgers(name: "Shroom Burger", price: 9.4, description: "몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거")
        case .Cheeseburger:
            return Burgers(name: "Cheeseburger", price: 6.9, description: "포테이토 번과 비프패티, 치즈가 토핑된 치즈버거")
        case .Hamburger:
            return Burgers(name: "Hamburger", price: 5.4, description: "비프패티를 기반으로 야채가 들어간 기본버거")
        }
    }
}

enum FrozenCustard: DetailMenu {
    
    case banila
    case choco
    case cookie
    
}

extension FrozenCustard {

    var instance: Menu {
        switch self {
        case .banila:
            return FrozenCustards(name: "banila icecream", price: 3.2, description: "바닐라 아이스크림")
        case .choco:
            return FrozenCustards(name: "choco icecream", price: 2.4, description: "초코 아이스크림")
        case .cookie:
            return FrozenCustards(name: "cookie icecream", price: 3.3, description: "쿠키 아이스크림")
        }
    }
}

enum Drink: DetailMenu {
    
    case Coke
    case Hwanta
    case DoctorPeppper
    case cider
    case iceTea
}
extension Drink {
    
    var instance: Menu {
        switch self {
        case .Coke:
            return Drinks(name: "coke", price: 3.1, description: "콜라")
        case .Hwanta:
            return Drinks(name: "hwanta", price: 2.4, description: "환타")
        case .DoctorPeppper:
            return Drinks(name: "doctor pepper", price: 4.1, description: "닥터 페퍼")
        case .cider:
            return Drinks(name: "cider", price: 1.2, description: "사이다")
        case .iceTea:
            return Drinks(name: "ice tea", price: 1.6, description: "아이스 티")
        }
    }
}

enum Beer: DetailMenu {
    
    case wine
    case beer
}

extension Beer {
    var instance: Menu {
        switch self {
        case .wine:
            return Beers(name: "wine", price: 12.0, description: "와인")
        case .beer:
            return Beers(name: "beer", price: 6.8, description: "맥주")
        }
    }
}

