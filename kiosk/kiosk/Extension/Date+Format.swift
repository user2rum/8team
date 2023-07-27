//
//  Date+.swift
//  kiosk
//
//  Created by hong on 2023/07/26.
//

import Foundation


extension Date {
    
    enum DisplayFormat: String {
        
        /// yyyy년 MM월 dd일 HH:mm
        case yearMonthDayTime = "yyyy년 MM월 dd일 HH:mm"
        
        /// "HH"
        case hourInt = "HH"
        /// "mm"
        case minuteInt = "mm"
    }
    
    func displayFormatted(_ displayFormat: DisplayFormat, timeZone: TimeZone = .autoupdatingCurrent) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .ko
        dateFormatter.dateFormat = displayFormat.rawValue
        dateFormatter.timeZone = timeZone
        return dateFormatter.string(from: self)
    }
    
    /// yyyy년 MM월 dd일 HH:mm
    var yearMonthDayTime: String {
        displayFormatted(.yearMonthDayTime)
    }
    
    /// 시간 Int 로
    var hourInt: Int {
        Int(self.displayFormatted(.hourInt))!
    }
    
    /// 분 Int 로
    var minuteInt: Int {
        Int(self.displayFormatted(.minuteInt))!
    }
    
    /// 오전, 오후 00:00 표기 법
    var mediumClockHourString: String {
        let medium: String
        if self.hourInt >= 12 {
            medium = "오후"
        } else {
            medium = "오전"
        }
        let hour = self.hourInt > 12 ? self.hourInt - 12 : self.hourInt
        return medium + " \(hour):\(String(format: "%02d", self.minuteInt))"
    }
    
}

extension Locale {
    static var ko = Locale(identifier: "ko")
}
