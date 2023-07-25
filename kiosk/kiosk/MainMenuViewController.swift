//
//  MainMenuViewController.swift
//  kiosk
//
//  Created by hong on 2023/07/24.
//

import Foundation

final class MainMenuViewController: CLViewController {
    private lazy var menuView: CLView = {
        let menuView = CLView()
        menuView.setContents("""
        아래 메뉴판을 보시고 메뉴를 골라 입력해주세요.

        [ SHAKESHACK MENU ]
        1. Burgers         | 앵거스 비프 통살을 다져만든 버거
        2. Frozen Custard  | 매장에서 신선하게 만드는 아이스크림
        3. Drinks          | 매장에서 직접 만드는 음료
        4. Beer            | 뉴욕 브루클린 브루어리에서 양조한 맥주
        0. 종료            | 프로그램 종료
        """)
        return menuView
    }()
    
    override init() {
        super.init()
        configure()
    }
}

extension MainMenuViewController {
    private func configure() {
        [menuView].forEach {
            addView($0)
        }
        menuView.setFrame(.init(size: .init(width: 50, height: 10)))
        updateLayout()
    }
}
