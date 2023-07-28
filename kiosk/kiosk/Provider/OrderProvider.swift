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
    func clearOrder() -> [Order]
    func getLastOrderTime() -> Date
    func setLastOrderTime(_ time: Date)
    func bankMaintenanceStartTime() -> String
    func bankMaintenanceEndTime() -> String
}

final class OrderProvider: OrderProviderProtocol {
    
    static let shared = OrderProvider()
    private init() {}
    
    private var orderList: [Order] = []
    private var lastOrderTime: Date = Date()
    
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
    
    func clearOrder() -> [Order] {
        orderList = []
        return orderList
    }
    
    func getLastOrderTime() -> Date {
        return lastOrderTime
    }
    
    func setLastOrderTime(_ time: Date) {
        self.lastOrderTime = time
    }
    
    func bankMaintenanceStartTime() -> String {
        return "02:00"
    }
    
    func bankMaintenanceEndTime() -> String {
        return "03:00"
    }
}
