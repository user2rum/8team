//
//  CLViewController.swift
//  kiosk
//
//  Created by hong on 2023/07/26.
//

import Foundation

class CLViewController {
    var views: [CLView] = []
    var size: Size = Size(width: 50, height: 20)
    private var background: String = " "
    lazy var displays: [[String]] = Array(repeating: Array(repeating: background, count: size.width), count: size.height)
    
    init() {
        viewDidLoad()
    }
    
    deinit {
        viewWillDisappear()
    }
    
    /// 뷰가 생성 되기 전에 호출 되는 메서드
    func viewDidLoad() {
        
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
