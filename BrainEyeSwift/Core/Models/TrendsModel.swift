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
    let scoreType: String?
    let unit: String?
    let scoreRange: Range?
    let normalRanges: [NormalRange]?
    let insight: Insight?
    let scorePoints: [ScorePoint]?
    let trendLine: [ScorePoint]?
    
    enum CodingKeys: String, CodingKey {
        case normalRanges = "normal_ranges"
        case scorePoints = "score_points"
        case scoreRange = "score_range"
        case scoreType = "score_type"
        case trendLine
        case insight
        case unit
    }
}

struct Insight: Decodable {
    let average: Int?
    let latest: Int?
    let range: Range?
}

struct NormalRange: Decodable {
    let range: Range?
    let startDate: Int?
    
    enum CodingKeys: String, CodingKey {
        case startDate = "start_date"
        case range
    }
}

struct ScorePoint: Decodable {
    let value: Int?
    let timestamp: TimeInterval?
}

struct Range: Decodable {
    let lowerBound: Int?
    let upperBound: Int?
    
    enum CodingKeys: String, CodingKey {
        case lowerBound = "lower_bound"
        case upperBound = "upper_bound"
    }
}
