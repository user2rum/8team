//
//  Double+Format.swift
//  kiosk
//
//  Created by hong on 2023/07/28.
//

import Foundation

extension Double {
    var toString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter.string(for: self)!
    }
}
