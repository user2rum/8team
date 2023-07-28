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
    func setSelectedMenu(_ menu: Menu)
    func getSelecetedMenu() -> Menu?
    func clearOrders() -> [Order]
    func canOrder() -> Bool
    func makeOrder() -> Date?
    func intervalSecondsFromLastOrder() -> Double
    func remainSecondsToOrder() -> Double
    func isBankMaintenanceTime() -> String? 
}

final class OrderRepository: OrderRepositoryProtocol {
    private let orderProvider: OrderProviderProtocol
    private var selectedMenu: Menu? = nil
    private var orderToNextSeconds: Double
    init(orderProvider: OrderProviderProtocol = OrderProvider.shared, orderToNextSeconds: Double = 3.0) {
        self.orderProvider = orderProvider
        self.orderToNextSeconds = orderToNextSeconds
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
    func setSelectedMenu(_ menu: Menu) {
        self.selectedMenu = menu
    }
    func getSelecetedMenu() -> Menu? {
        self.selectedMenu
    }
    func clearOrders() -> [Order] {
        return orderProvider.clearOrder()
    }
    func canOrder() -> Bool {
        return intervalSecondsFromLastOrder() > orderToNextSeconds
    }
    func makeOrder() -> Date? {
        let orderDate = Date()
        if canOrder() {
            orderProvider.setLastOrderTime(orderDate)
            return orderDate
        } else {
            return nil
        }
    }
    func intervalSecondsFromLastOrder() -> Double {
        let currentTime = Date()
        let lastOrderedTime = orderProvider.getLastOrderTime()
        let timeInterval = currentTime.timeIntervalSince(lastOrderedTime)
        let timeIntervalInSeconds = abs(timeInterval)
        return timeIntervalInSeconds
    }
    func remainSecondsToOrder() -> Double {
        return orderToNextSeconds - intervalSecondsFromLastOrder()
    }
    func isBankMaintenanceTime() -> String? {
        let currentTime = Date()
        let bankMaintenanceStarTime = orderProvider.bankMaintenanceStartTime()
        let bankMaintenanceEndTime = orderProvider.bankMaintenanceEndTime()
        if currentTime.between(from: bankMaintenanceStarTime, to: bankMaintenanceEndTime) {
            return "\(bankMaintenanceStarTime) ~ \(bankMaintenanceEndTime) 은 은행 점검시간입니다."
        } else {
            return nil
        }
    }
}



