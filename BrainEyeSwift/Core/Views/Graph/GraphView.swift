//
//  GraphView.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

import SwiftUI
import Charts

private let normalRangeColor = Color.gray.opacity(0.2)

struct GraphView: View {
    
    let title: String
    let subTitle: String
    let unit: String
    
    let normalRange: Range
    let scoreRange: Range
    let scorePoints: [ScorePoint]
    let trendLines: [ScorePoint]
    
    var body: some View {
        VStack {
            GraphTitleView(
                title: "\(title) (\(unit))",
                subTitle: subTitle
            )
            
            GraphContentView(
                normalRange: normalRange,
                scoreRange: scoreRange,
                scorePoints: scorePoints,
                trendLines: trendLines
            )
            
            GraphLegend()
                .padding([.top], 20)
        }
    }
}

private struct GraphTitleView: View {
    
    let title: String
    let subTitle: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(subTitle)
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

private struct GraphContentView: View {
    
    let normalRange: Range
    let scoreRange: Range
    let scorePoints: [ScorePoint]
    let trendLines: [ScorePoint]
    
    var body: some View {
        Chart {
            ForEach(trendLines, id: \.value) { item in
                LineMark(
                    x: .value("line-x", item.timestamp ?? 0),
                    y: .value("line-y", item.value ?? 0)
                )
            }
            
            ForEach(scorePoints, id: \.value) { item in
                PointMark(
                    x: .value("point-x", item.timestamp ?? 0),
                    y: .value("point-y", item.value ?? 0)
                )
            }
            
            RectangleMark(
                yStart: .value("mark-start-y", normalRange.lowerBound ?? 0),
                yEnd: .value("mark-end-y", normalRange.upperBound ?? 0)
            )
            .foregroundStyle(normalRangeColor)
        }
        .aspectRatio(1, contentMode: .fit)
        .chartYScale(domain: scoreRange.domain)
        .chartXScale(domain: trendLines.domain)
        .chartXAxis(.hidden)
    }
}

private struct GraphLegend: View {
    
    private let rectangleSiZe: CGFloat = 15
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(normalRangeColor)
                .frame(width: rectangleSiZe, height: rectangleSiZe)
            
            Text("Normal range")
                .font(.caption)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    let scorePoints: [ScorePoint] = [
        ScorePoint(value: 85, timestamp: 1689188395.0),
        ScorePoint(value: 59, timestamp: 1690468898.0),
        ScorePoint(value: 78, timestamp: 1690987416.0),
        ScorePoint(value: 47, timestamp: 1691330551.0),
        ScorePoint(value: 89, timestamp: 1691492358.0),
    ]
    
    let trendLines: [ScorePoint] = [
        ScorePoint(value: 85, timestamp: 1689188395.0),
        ScorePoint(value: 83, timestamp: 1690468898.0),
        ScorePoint(value: 82, timestamp: 1690987416.0),
        ScorePoint(value: 78, timestamp: 1691330551.0),
        ScorePoint(value: 81, timestamp: 1691492358.0),
    ]
    
    GraphView(
        title: "Accuracy",
        subTitle: "Jan-Jul 2024",
        unit: "%",
        normalRange: Range(lowerBound: 50, upperBound: 100),
        scoreRange: Range(lowerBound: 5, upperBound: 100),
        scorePoints: scorePoints,
        trendLines: trendLines
    )
}