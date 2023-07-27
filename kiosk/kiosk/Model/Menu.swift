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

protocol MenuProtocol {
    var instance: Menu { get }
}

typealias DetailMenu = CaseIterable & MenuProtocol

