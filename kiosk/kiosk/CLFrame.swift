//
//  CLFrame.swift
//  kiosk
//
//  Created by hong on 2023/07/25.
//

import Foundation

class Frame {
    var size: Size = Size()
    var origin: Origin = Origin()
    
    func isInBound(from frame: Frame) -> Bool {
        if (frame.origin.x...frame.size.width ~= origin.x
            && frame.origin.y...frame.size.height ~= origin.y) {
            return true
        } else {
            return false
        }
    }
    
    convenience init(size: Size, origin: Origin) {
        self.init()
        self.size = size
        self.origin = origin
    }
    
    convenience init(size: Size) {
        self.init()
        self.size = size
    }
    
    convenience init(origin: Origin) {
        self.init()
        self.origin = origin
    }
}

class Size {
    var width: Int = 0
    var height: Int = 0
    
    convenience init(width: Int, height: Int) {
        self.init()
        self.width = width
        self.height = height
    }
}

class Origin {
    var x: Int = 0
    var y: Int = 0
    
    convenience init(x: Int, y: Int) {
        self.init()
        self.x = x
        self.y = y
    }
}


