//
//  TimeInterval+Extension.swift
//  BrainEyeSwift
//
//  Created by Paul on 24/12/2024.
//

import Foundation

extension TimeInterval {
    var dayAndMonth: String {
        let date = Date(timeIntervalSince1970: self)
         let formatter = DateFormatter()
         formatter.dateFormat = "d MMM"
         return formatter.string(from: date)
    }
}
