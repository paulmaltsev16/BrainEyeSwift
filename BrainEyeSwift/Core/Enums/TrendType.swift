//
//  TrendType.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

import Foundation

enum TrendType: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case accuracy = "Accuracy"
    case responseTime = "Response Time"
}
