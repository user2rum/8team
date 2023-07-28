//
//  SelectedMenuViewController.swift
//  kiosk
//
//  Created by hong on 2023/07/28.
//

import Foundation

final class SelectedMenuViewController: CLViewController {
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

extension SelectedMenuViewController {
    private func configure() {
        if let selectedMenu = orderRepository.getSelecetedMenu() {
            var viewContext = "\(selectedMenu.displayName()) : \(selectedMenu.displayPrice().toString) :  \(selectedMenu.displayInfo())\n위 메뉴를 장바구니에 추가하시겠습니까?"
            viewContext += "\n1. 확인 2. 취소"
            menuView.setContents(viewContext)
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
