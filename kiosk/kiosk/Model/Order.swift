//
//  Order.swift
//  kiosk
//
//  Created by hong on 2023/07/26.
//

import Foundation

struct Order: Equatable {
    let menu: Menu
    private let createdAt: Date
    private var updatedAt: Date
    
    init(menu: Menu) {
        self.menu = menu
        self.createdAt = Date()
        self.updatedAt = Date()
    }
}
