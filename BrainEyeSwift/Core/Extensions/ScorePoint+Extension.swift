//
//  ScorePoint+Extension.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

import Foundation

extension Array<ScorePoint> {
    var measurePeriod: String? {
        guard let firstTimestamp = first?.timestamp,
              let lastTimestamp = last?.timestamp
        else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        let firstDate = Date(timeIntervalSince1970: firstTimestamp)
        let lastDate = Date(timeIntervalSince1970: lastTimestamp)
        
        let firstMonth = dateFormatter.string(from: firstDate).split(separator: " ").first ?? ""
        let lastMonth = dateFormatter.string(from: lastDate).split(separator: " ").first ?? ""
        let year = Calendar.current.component(.year, from: lastDate)
        
        return "\(firstMonth)-\(lastMonth) \(year)"
    }
    
    var domain: ClosedRange<Double> {
        let minTimestamp = self.min { ($0.timestamp ?? 0) <= ($1.timestamp ?? 0) }?.timestamp ?? 0.0
        let maxTimestamp = self.max { ($0.timestamp ?? 0) < ($1.timestamp ?? 0) }?.timestamp ?? 0.0
        return minTimestamp...maxTimestamp
    }
}
