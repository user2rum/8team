//
//  CLKit.swift
//  kiosk
//
//  Created by hong on 2023/07/25.
//

import Foundation

class CLViewController {
    var views: [CLView] = []
    var size: Size = Size(width: 50, height: 20)
    private var background: String = " "
    lazy var displays: [[String]] = Array(repeating: Array(repeating: background, count: size.width), count: size.height)
    
    init() {
        viewWillAppear()
    }
    
    deinit {
        viewWillDisappear()
    }
    
    /// 뷰가 생성 되기 전에 호출 되는 메서드
    func viewWillAppear() {
        
    }
    
    /// 뷰가 사라지기 직전에 호출 되는 메서드
    func viewWillDisappear() {
        
    }
    
    /// 뷰 추가하는 메서드
    func addView(_ view: CLView) {
        views.append(view)
    }
    
    func setSize(_ size: Size) {
        self.size = size
        updateLayout()
    }
    
    /// 내부적으로 레이아웃을 변경 하고 호출 해야 하는 메서드, 호출 하지 않는 다면 변경된 레이아웃이 적용 안 됨
    func updateLayout() {
        displays = Array(repeating: Array(repeating: background, count: size.width), count: size.height)
        let viewConrollerFrame = Frame(size: self.size)
        for view in views {
            let viewFrame = view.getFrame()
            let viewContents = view.getContents()
            
            if viewFrame.isInBound(from: viewConrollerFrame) {
                let viewContentHeight = viewFrame.origin.y + viewFrame.size.height
                let rowLimit = viewContentHeight <= size.height ? viewContentHeight : size.height
                for row in viewFrame.origin.y..<rowLimit {
                    let viewContent = viewContents[row-viewFrame.origin.y]
                    let viewContentWidth = viewFrame.origin.x + viewFrame.size.width
                    let colLimit = viewContentWidth <= size.width ? viewContentWidth : size.width
                    for col in viewFrame.origin.x..<colLimit {
                        displays[row][col] = viewContent[col-viewFrame.origin.x]
                    }
                }
            }
            
        }
    }
    
    /// 커맨드 라인 창에 뷰가 보여지게 하는 메서드
    func showView() {
        let topBottomBorderLine = [Array(repeating: "-", count: size.width+2)]
        let withBorderLineDisplays = topBottomBorderLine + displays.map { ["|"] + $0 + ["|"] } + topBottomBorderLine
        print(withBorderLineDisplays.map { $0.joined()+"\n" }.joined())
    }
}

class CLView {
    private var frame: Frame = Frame()
    private var contents: [[String]] = []
    private var contentString: String = ""
    func setContents(_  text: String) {
        self.contentString = text
        updateContents()
    }
    func getContents() -> [[String]] {
        return contents
    }
    func setFrame(_ frame: Frame) {
        self.frame = frame
        contents = Array(repeating: Array(repeating: " ", count: frame.size.width), count: frame.size.height)
        updateContents()
    }
    func getFrame() -> Frame {
        return frame
    }
    private func updateContents() {
        let splitedContentStrings = contentString.components(separatedBy: "\n")
        let rowLimit = splitedContentStrings.count <= frame.size.height ? splitedContentStrings.count : frame.size.height
        for row in 0..<rowLimit {
            let splitedContentString = splitedContentStrings[row].map{ String($0) }
            let colLimit = splitedContentString.count <= frame.size.width ? splitedContentString.count : frame.size.width
            for col in 0..<colLimit {
                contents[row][col] = splitedContentString[col]
            }
        }
    }
}

class CLNavigationController {
    private var viewControllers: [CLViewController] = []
    
    init() {
        push(ViewType.mainMenu.viewController)
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
