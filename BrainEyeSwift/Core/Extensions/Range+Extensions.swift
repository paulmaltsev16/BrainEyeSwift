//
//  Range+Extensions.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

import Foundation

extension Range {
    var displayedTitle: String {
        return "\(lowerBound ?? 0)-\(upperBound ?? 0)"
    }
}
