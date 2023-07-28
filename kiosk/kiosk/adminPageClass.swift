//
//  File.swift
//  KioskApp
//
//  Created by Lee on 2023/07/27.
//

import Foundation


class AdminClass {
    private var burgerMenu: [Burger] = []
    
    func addBurger(burger: Burger) {
        burgerMenu.append(burger)
    }
    func showBurgerMenu() {
        for(index, burger) in burgerMenu.enumerated() {
            let number = index + 1
            print("Burger \(index + 1)")
            burger.showPrint()
           }
    }

    func deleteBurger(at index: Int) {
        burgerMenu.remove(at: index)
    }
}

func adminFunction() {
    let menuAdmin = AdminClass()
    if let a = readLine(),
       let b = Int(a) {
        switch b {
        case 1:
            print("메뉴를 추가합니다.")
            print("이름을 입력하세요: ")
            if let name = readLine(), !name.isEmpty {
                print("가격을 입력하세요: ")
                if let priceStr = readLine(), let price = Int(priceStr) {
                    print("재료를 입력하세요 (각 재료를 쉼표로 구분해주세요): ", terminator: "")
                    if let compStr = readLine(), !compStr.isEmpty {
                        let comp = compStr.components(separatedBy: ", ")
                        let newBurger = Burger(name: name, price: price, comp: comp)
                        menuAdmin.addBurger(burger: newBurger)
                        print("\(name) 메뉴가 추가되었습니다.")
                    } else {
                        print("재료를 입력해주세요.")
                    }
                } else {
                    print("유효한 가격을 입력해주세요.")
                }
            } else {
                print("이름을 입력해주세요.")
            }
        case 2:
            print("구현 준비중입니다.")
        case 3:
            print("메뉴를 조회합니다.")
        case 0 :
            print("관리자모드를 종료합니다.")
            startMenu()
        default: print("오작동. 시스템 재시작")
            
        }
    }
}
