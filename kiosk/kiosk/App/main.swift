//
//  main.swift
//  kiosk
//
//  Created by t2023-m0075 on 2023/07/24.
//

import Foundation

let main = Main(
    menuRepository: MenuRepository(provider: .init(), selectedShop: .shakeShackBurger),
    orderRepository: OrderRepository(),
    orderQueue: DispatchQueue(label: "주문 큐"),
    timerQueue: DispatchQueue(label: "타이머 큐")
)
main.start()

final class Main {
    private var flag: Bool = true
    private var currentController: ViewType
    private let navigationController: CLNavigationController
    private let menuRepository: MenuRepositoryProtocol
    private let orderRepository: OrderRepositoryProtocol
    private let orderQueue: DispatchQueue
    private let timerQueue: DispatchQueue
    
    init(
        menuRepository: MenuRepositoryProtocol,
        orderRepository: OrderRepositoryProtocol,
        orderQueue: DispatchQueue,
        timerQueue: DispatchQueue
    ) {
        self.menuRepository = menuRepository
        self.orderRepository = orderRepository
        self.navigationController = CLNavigationController(rootViewController: ViewType.`init`(menuRepository).viewController)
        currentController = .`init`(menuRepository)
        self.orderQueue = orderQueue
        self.timerQueue = timerQueue
    }
    
    func start() {
        while flag {
            orderQueue.async {
                self.order()
            }
            timerQueue.async {
                self.timer()
            }
        }
    }
    
    private func order() {
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
                        presentSingleViewControllerDoNotShowUnderViewController(in: "잘못된 번호를 입력했어요 다시 입력해주세요.")
                    } else {
                        let shop = shopList[inputInt-1]
                        currentController = .mainMenu(menuRepository, orderRepository)
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
                        if orderRepository.getOrders().isEmpty {
                            presentSingleViewControllerDoNotShowUnderViewController(in: "잘못된 번호를 입력했어요 다시 입력해주세요.")
                        } else {
                            if inputInt == menuList.count + 1 {
                                currentController = .shoppingCart(orderRepository)
                                navigationController.push(currentController.viewController)
                            } else if inputInt == menuList.count + 2 {
                                _ = orderRepository.clearOrders()
                                navigateToMainMenu()
                            }
                        }
                        
                    } else {
                        let menu = menuList[inputInt-1]
                        menuRepository.setSelectedCategory(menu)
                        currentController = .detailMenu(menuRepository)
                        navigationController.push(currentController.viewController)
                    }
                case .detailMenu:
                    if let selectedCategory = menuRepository.selectedCategory,
                       let menuList = menuRepository.getDetailCategory(selectedCategory) {
                        if inputInt == 0 {
                            menuRepository.setSelectedCategory(nil)
                            currentController = .mainMenu(menuRepository,orderRepository)
                            navigationController.pop()
                        } else if inputInt-1 >= menuList.count {
                            presentSingleViewControllerDoNotShowUnderViewController(in: "잘못된 번호를 입력했어요 다시 입력해주세요.")
                        } else {
                            let menu = menuList[inputInt-1]
                            orderRepository.setSelectedMenu(menu)
                            currentController = .selectedMenu(orderRepository)
                            navigationController.push(currentController.viewController)
                        }
                        
                    } else {
                        menuRepository.setSelectedCategory(nil)
                        currentController = .mainMenu(menuRepository, orderRepository)
                        navigationController.pop()
                    }

                case .selectedMenu:
                    if inputInt == 1 {
                        if let selectedMenu = orderRepository.getSelecetedMenu() {
                            let order = Order(menu: selectedMenu)
                            _ = orderRepository.insertOrder(order)
                        }
                        navigateToMainMenu()
                    } else if inputInt == 2 {
                        navigateToMainMenu()
                    } else {
                        presentSingleViewControllerDoNotShowUnderViewController(in: "잘못된 번호를 입력했어요 다시 입력해주세요.")
                    }
                case .shoppingCart:
                    if inputInt == 1 {
                        if let maintenanceInformationString = orderRepository.isBankMaintenanceTime() {
                            presentSingleViewController(in: "현재 시간은 \(Date().mediumClockHourString) 입니다. " + "\(maintenanceInformationString)")
                        } else {
                            if orderRepository.canOrder() {
                                if let orderDate = orderRepository.makeOrder() {
                                    navigationController.push(ViewType.other("주문이 완료 되었습니다.  -  \(orderDate.yearMonthDayTime)").viewController)
                                    _ = orderRepository.clearOrders()
                                    navigateToMainMenu()
                                } else {
                                    
                                    presentSingleViewControllerDoNotShowUnderViewController(in: "주문이 실패 했습니다. 다시 시도해주세요.")
                                }
                            } else {
                                let intervalSeoncdsFromLastOrder = orderRepository.remainSecondsToOrder()
                                presentSingleViewControllerDoNotShowUnderViewController(in: "\(intervalSeoncdsFromLastOrder.toString) 초 후에 주문을 하실 수 있습니다.")
                            }
                        }
                    } else if inputInt == 2 {
                        navigateToMainMenu()
                    } else {
                        presentSingleViewControllerDoNotShowUnderViewController(in: "잘못된 번호를 입력했어요 다시 입력해주세요.")
                    }
                default:
                    continue
                }
            } else {
                presentSingleViewControllerDoNotShowUnderViewController(in: "잘못된 번호를 입력했어요 다시 입력해주세요.")
            }

        }
    }
    
    private func end() {
        flag = false
    }
    
    private func navigateToMainMenu() {
        menuRepository.setSelectedCategory(nil)
        navigationController.popAll()
        navigationController.pushDonotShow(ViewType.`init`(menuRepository).viewController)
        currentController = .mainMenu(menuRepository, orderRepository)
        navigationController.push(currentController.viewController)
    }
    
    private func presentSingleViewController(in text: String) {
        navigationController.push(ViewType.other(text).viewController)
        navigationController.pop()
    }
    
    private func presentSingleViewControllerDoNotShowUnderViewController(in text: String) {
        navigationController.push(ViewType.other(text).viewController)
        navigationController.popDonotShow()
    }
    
    private func timer() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            self.presentSingleViewControllerDoNotShowUnderViewController(in: "\(self.orderRepository.getOrders().count) 주문 대기중")
        }
        RunLoop.current.run()
    }
}
