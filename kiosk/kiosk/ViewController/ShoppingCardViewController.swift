//
//  ShoppingCardViewController.swift
//  kiosk
//
//  Created by hong on 2023/07/28.
//

import Foundation

final class ShoppingCartViewController: CLViewController {
    private lazy var menuView: CLView = CLView()
    private let orderRepository: OrderRepositoryProtocol
    init(orderRepository: OrderRepositoryProtocol) {
        self.orderRepository = orderRepository
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
}

extension ShoppingCartViewController {
    private func configure() {
        let orders = orderRepository.getOrders()
        
        if !orders.isEmpty {
            var viewContents = "[ Orders ]\n"
            for order in orders {
                viewContents += "\n\(order.menu.displayName()) - \(order.menu.displayPrice().toString) 원 - \(order.menu.displayInfo())"
            }
            viewContents += "\n\n[ Total ]"
            viewContents += "\n\(orders.reduce(0.0, { $0 + $1.menu.displayPrice() }))"
            viewContents += "\n\n1. 주문   2. 메뉴판"
            menuView.setContents(viewContents)
        } else {
            menuView.setContents("죄송합니다. 선택된 메뉴가 없습니다.")
        }
        
        [menuView].forEach {
            addView($0)
        }
        menuView.setFrame(.init(size: .init(width: 100, height: 100)))
        updateLayout()
    }
}
