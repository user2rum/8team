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
    
    init(menuRepository: MenuRepositoryProtocol) {
        self.menuRepository = menuRepository
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
        } else {
            viewContext = "\n메뉴가 준비 중입니다\n죄송합니다 🥺🥺🥺🥺\n"
        }
        viewContext += "\n0. 뒤로가기"
        menuView.setContents(viewContext)
        
        [menuView].forEach {
            addView($0)
        }
        menuView.setFrame(.init(size: .init(width: 50, height: 10)))
        updateLayout()
    }
}
