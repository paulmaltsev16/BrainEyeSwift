//
//  TrendsModel.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

import Foundation

struct Trends: Decodable {
    let trends: [Trend]?
}

struct Trend: Decodable {
    let scoreType, unit: String?
    let scoreRange: Range?
    let normalRanges: [NormalRange]?
    let insight: Insight?
    let scorePoints, trendLine: [ScorePoint]?
}

struct Insight: Decodable {
    let average, latest: Int?
    let range: Range?
}

struct NormalRange: Decodable {
    let range: Range?
    let startDate: Int?
}

struct ScorePoint: Decodable {
    let value, timestamp: Int?
}

struct Range: Decodable {
    let lowerBound, upperBound: Int?
}
