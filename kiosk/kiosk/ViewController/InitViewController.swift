//
//  InitViewController.swift
//  kiosk
//
//  Created by hong on 2023/07/26.
//

import Foundation

final class InitViewController: CLViewController {
    
    private lazy var menuView: CLView = CLView()
    
    private let menuRepository: MenuRepositoryProtocol
    
    init(menuRepository: MenuRepositoryProtocol) {
        self.menuRepository = menuRepository
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
}

extension InitViewController {
    private func configure() {
        
        var viewContext = "[메뉴를 볼 대상을 선택해주세요.]\n"
        if let shopList = menuRepository.getShopList() {
            for (index, shop) in shopList.enumerated() {
                viewContext += "\n\(index+1) : \(shop.rawValue)"
            }
        } else {
            viewContext = "\n메뉴가 준비 중입니다\n죄송합니다 🥺🥺🥺🥺\n"
        }

        viewContext += "\n0 : 프로그램 종료"
        menuView.setContents(viewContext)
        
        [menuView].forEach {
            addView($0)
        }
        menuView.setFrame(.init(size: .init(width: 50, height: 10)))
        updateLayout()
    }
    
}
