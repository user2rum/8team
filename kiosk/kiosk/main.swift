//
//  main.swift
//  kiosk
//
//  Created by t2023-m0075 on 2023/07/24.
//

import Foundation

let main = Main()
main.start()

final class Main {
    private var flag: Bool = true
    private var currentController: ViewType = .mainMenu
    private let navigationController: CLNavigationController = .init()
    
    func start() {
        while flag {
            let inputString = readLine()!
            switch currentController {
            case .mainMenu:
                if let mainMenuType = MainMenuType(rawValue: inputString) {
                    switch mainMenuType {
                    case .end:
                        navigationController.push(ViewType.endProgram.viewController)
                        navigationController.popAll()
                        end()
                    case .burgers:
                        currentController = .burgerMenu
                        navigationController.push(currentController.viewController)
                    case .frozenCustard:
                        currentController = .frozenCustard
                        navigationController.push(currentController.viewController)
                    case .drinks:
                        currentController = .drinks
                        navigationController.push(currentController.viewController)
                    case .bear:
                        currentController = .bear
                        navigationController.push(currentController.viewController)
                        
                    }
                } else {
                    navigationController.push(ViewType.other("잘못된 번호를 입력했어요 다시 입력해주세요.").viewController)
                }
            case .burgerMenu:
                if inputString == "0" {
                    navigationController.pop()
                }
            case .frozenCustard:
                if inputString == "0" {
                    navigationController.pop()
                }
            case .drinks:
                if inputString == "0" {
                    navigationController.pop()
                }
            case .bear:
                if inputString == "0" {
                    navigationController.pop()
                }
            default:
                continue
            }
        }
    }
    
    private func end() {
        flag = false
    }
}
