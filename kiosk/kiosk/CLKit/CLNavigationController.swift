//
//  CLNavigationController.swift
//  kiosk
//
//  Created by hong on 2023/07/26.
//

import Foundation

class CLNavigationController {
    private var viewControllers: [CLViewController] = []
    
    init(rootViewController: CLViewController) {
        push(rootViewController)
    }
    
    /// 뷰 추가
    func push(_ viewController: CLViewController) {
        viewControllers.append(viewController)
        viewController.showView()
    }
    
    /// 뷰 제거
    func pop() {
        viewControllers.removeLast()
        guard let lastController = viewControllers.last else { return }
        lastController.showView()
    }
    
    /// 전체 뷰 제거
    func popAll() {
        viewControllers = []
    }
}
