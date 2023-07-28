//
//  MainMenuViewController.swift
//  kiosk
//
//  Created by hong on 2023/07/24.
//

import Foundation

final class MainMenuViewController: CLViewController {
    private lazy var menuView: CLView = CLView()
    private let menuRepository: MenuRepositoryProtocol
    private let orderRepository: OrderRepositoryProtocol
    
    init(
        menuRepository: MenuRepositoryProtocol,
        orderRepository: OrderRepositoryProtocol
    ) {
        self.menuRepository = menuRepository
        self.orderRepository = orderRepository
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        configure()
    }
}


extension MainMenuViewController {
    private func configure() {
        
        var viewContext = "[ \(menuRepository.selectedShop.rawValue) MENU ]\n"
        if let menuList = menuRepository.getShopsMenus(menuRepository.selectedShop) {
            for (index, menu) in menuList.keys.enumerated() {
                viewContext += "\n\(index+1). \(menu.displayName()) : \(menu.displayInfo())"
            }
            let orders = orderRepository.getOrders()
            if !orders.isEmpty {
                viewContext += "\n\n\n\n\(menuList.count + 1). Order  : 장바구니를 확인 후 주문합니다."
                viewContext += "\n\(menuList.count + 2). Cancel : 진행중인 주문을 취소합니다."
            }
        } else {
            viewContext = "\n메뉴가 준비 중입니다\n죄송합니다 🥺🥺🥺🥺\n"
        }
        viewContext += "\n0. 뒤로가기"
        menuView.setContents(viewContext)
        
        [menuView].forEach {
            addView($0)
        }
        menuView.setFrame(.init(size: .init(width: 50, height: 20)))
        updateLayout()
    }
}
