//
//  OrderProvider.swift
//  kiosk
//
//  Created by hong on 2023/07/26.
//

import Foundation

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
