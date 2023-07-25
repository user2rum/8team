//
//  SingleLineViewController.swift
//  kiosk
//
//  Created by hong on 2023/07/25.
//

import Foundation

final class SingleLineViewController: CLViewController {
    
    private lazy var singleLineView: CLView = .init()
    
    init(singleLine text: String) {
        super.init()
        singleLineView.setContents(text)
        configure()
    }
}

extension SingleLineViewController {
    private func configure() {
        [singleLineView].forEach {
            addView($0)
        }
        singleLineView.setFrame(.init(size: .init(width: self.size.width, height: 1)))
        setSize(.init(width: self.size.width, height: 1))
        updateLayout()
    }
}
