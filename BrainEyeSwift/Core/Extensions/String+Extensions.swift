//
//  String+Extensions.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

import Foundation

extension String {
    var unitDisplayType: String {
        switch self {
        case "percentage": return "%"
        case "milliseconds": return "ms"
        default: return "-"
        }
    }
}
