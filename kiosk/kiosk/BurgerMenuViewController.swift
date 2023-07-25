//
//  BurgerMenuViewConroller.swift
//  kiosk
//
//  Created by hong on 2023/07/24.
//

import Foundation

final class BurgerMenuViewController: CLViewController {
    private lazy var menuView: CLView = {
        let menuView = CLView()
        menuView.setContents("""
        [ Burgers MENU ]
        1. ShackBurger   | W 6.9 | 토마토, 양상추, 쉑소스가 토핑된 치즈버거
        2. SmokeShack    | W 8.9 | 베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거
        3. Shroom Burger | W 9.4 | 몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거
        3. Cheeseburger  | W 6.9 | 포테이토 번과 비프패티, 치즈가 토핑된 치즈버거
        4. Hamburger     | W 5.4 | 비프패티를 기반으로 야채가 들어간 기본버거
        0. 뒤로가기      | 뒤로가기
        """)
        return menuView
    }()
    
    override init() {
        super.init()
        configure()
    }
}

extension BurgerMenuViewController {
    private func configure() {
        [menuView].forEach {
            addView($0)
        }
        menuView.setFrame(.init(size: .init(width: 100, height: 100)))
        updateLayout()
    }
}
