//
//  DetailMenuViewController.swift
//  kiosk
//
//  Created by hong on 2023/07/24.
//

import Foundation

final class DetailMenuViewController: CLViewController {
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

extension DetailMenuViewController {
    private func configure() {
        
        var viewContext = "[ \(menuRepository.selectedCategory?.displayName() ?? "") MENU]\n"
        if let selectedCategory = menuRepository.selectedCategory,
           let menuList = menuRepository.getDetailCategory(selectedCategory) {
            for (index, menu) in menuList.enumerated() {
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
        menuView.setFrame(.init(size: .init(width: 100, height: 100)))
        updateLayout()
    }
}
