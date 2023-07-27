//
//  main.swift
//  kiosk
//
//  Created by t2023-m0075 on 2023/07/24.
//

import Foundation

let main = Main(
    menuRepository: MenuRepository(provider: .init(), selectedShop: .shakeShackBurger),
    orderRepository: OrderRepository()
)
main.start()

final class Main {
    private var flag: Bool = true
    private var currentController: ViewType
    private let navigationController: CLNavigationController
    private let menuRepository: MenuRepositoryProtocol
    private let orderRepository: OrderRepositoryProtocol
    
    init(menuRepository: MenuRepositoryProtocol, orderRepository: OrderRepositoryProtocol) {
        self.menuRepository = menuRepository
        self.orderRepository = orderRepository
        self.navigationController = CLNavigationController(rootViewController: ViewType.`init`(menuRepository).viewController)
        currentController = .`init`(menuRepository)
    }
    
    func start() {
        while flag {
            if let inputString = readLine(),
               let inputInt = Int(inputString) {
                switch currentController {
                case .`init`:
                    let shopList = menuRepository.getShopList() ?? []
                    if inputInt == 0 {
                        navigationController.push(ViewType.endProgram.viewController)
                        navigationController.popAll()
                        end()
                    } else if inputInt-1 >= shopList.count {
                        navigationController.push(ViewType.other("잘못된 번호를 입력했어요 다시 입력해주세요.").viewController)
                        navigationController.pop()
                    } else {
                        let shop = shopList[inputInt-1]
                        currentController = .mainMenu(menuRepository)
                        menuRepository.setSelectedShop(shop)
                        navigationController.push(currentController.viewController)
                    }
                case .mainMenu:
                    let menuList = (menuRepository.getShopsMenus(menuRepository.selectedShop) ?? [:]).keys.map { $0 }
                    if inputInt == 0 {
                        currentController = .`init`(menuRepository)
                        menuRepository.setSelectedShop(.shakeShackBurger)
                        menuRepository.setSelectedCategory(nil)
                        navigationController.pop()
                    } else if inputInt-1 >= menuList.count {
                        navigationController.push(ViewType.other("잘못된 번호를 입력했어요 다시 입력해주세요.").viewController)
                        navigationController.pop()
                    } else {
                        let menu = menuList[inputInt-1]
                        menuRepository.setSelectedCategory(menu)
                        currentController = .detailMenu(menuRepository)
                        navigationController.push(currentController.viewController)
                    }
                case .detailMenu:
                    if inputInt == 0 {
                        currentController = .mainMenu(menuRepository)
                        navigationController.pop()
                    }
                    
                default:
                    continue
                }
            } else {
                navigationController.push(ViewType.other("잘못된 번호를 입력했어요 다시 입력해주세요.").viewController)
                navigationController.pop()
            }

        }
    }
    
    private func end() {
        flag = false
    }
}
