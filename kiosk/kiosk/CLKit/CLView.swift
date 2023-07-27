//
//  CLView.swift
//  kiosk
//
//  Created by hong on 2023/07/26.
//

import Foundation

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
