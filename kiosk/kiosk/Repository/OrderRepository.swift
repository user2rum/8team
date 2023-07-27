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



