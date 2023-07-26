//
//  OrderRepository.swift
//  kiosk
//
//  Created by hong on 2023/07/25.
//

import Foundation

protocol OrderRepositoryProtocol {
    func getOrders() -> [Order]
    func deleteOrder(_ order: Order) -> [Order]
    func insertOrder(_ order: Order) -> [Order]
}

final class OrderRepository: OrderRepositoryProtocol {
    private let orderProvider: OrderProviderProtocol
    init(orderProvider: OrderProviderProtocol = OrderProvider.shared) {
        self.orderProvider = orderProvider
    }
    func getOrders() -> [Order] {
        return orderProvider.getOrder()
    }
    func deleteOrder(_ order: Order) -> [Order] {
        return orderProvider.deleteOrder(order)
    }
    func insertOrder(_ order: Order) -> [Order] {
        return orderProvider.insertOrder(order)
    }
}

protocol OrderProviderProtocol {
    func getOrder() -> [Order]
    func deleteOrder(_ order: Order) -> [Order]
    func insertOrder(_ order: Order) -> [Order]
}

final class OrderProvider: OrderProviderProtocol {
    
    static let shared = OrderProvider()
    private init() {}
    
    private var orderList: [Order] = []
    
    func getOrder() -> [Order] {
        return orderList
    }
    
    func deleteOrder(_ order: Order) -> [Order] {
        orderList = orderList.filter { $0 != order }
        return getOrder()
    }
    
    func insertOrder(_ order: Order) -> [Order] {
        orderList.append(order)
        return getOrder()
    }
}

struct Order: Equatable {
    private let menu: Menu
    private let createdAt: Date
    private var updatedAt: Date
    
    init(menu: Menu) {
        self.menu = menu
        self.createdAt = Date()
        self.updatedAt = Date()
    }
}
