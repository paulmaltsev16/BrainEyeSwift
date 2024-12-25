//
//  Range+Extensions.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

import Foundation
import Charts

extension Range {
    var displayedTitle: String {
        return "\(lowerBound ?? 0)-\(upperBound ?? 0)"
    }
    
    var domain: ClosedRange<Int> {
        return (lowerBound ?? 0)...(upperBound ?? 0)
    }
}
