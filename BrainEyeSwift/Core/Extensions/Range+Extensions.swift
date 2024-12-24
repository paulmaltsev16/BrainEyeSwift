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
        let lower = (lowerBound ?? 0) < 25 ? 0 : (lowerBound ?? 0)
        return lower...(upperBound ?? 0)
    }
}
