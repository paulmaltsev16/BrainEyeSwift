//
//  TrendDetailsView.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

import SwiftUI

struct TrendDetailsView: View {
    
    let trendType: TrendType
    let trend: Trend?
    
    var body: some View {
        VStack {
            if let trend,
               let insight = trend.insight
            {
                GraphView(
                    title: trendType.rawValue,
                    subTitle: trend.scorePoints?.measurePeriod ?? "",
                    unit: trend.unit?.unitDisplayType ?? "",
                    normalRange: trend.normalRanges!.first!.range!, // According to the assignment, take the first one.
                    scoreRange: trend.scoreRange ?? Range(lowerBound: 0, upperBound: 0),
                    scorePoints: trend.scorePoints ?? [],
                    trendLines: trend.trendLine ?? []
                )
                .frame(maxHeight: .infinity)
                
                InsightsView(
                    insight: insight,
                    unit: trend.unit?.unitDisplayType ?? ""
                )
            } else {
                Text("Oops! Something went wrong. \nWe’re unable to provide \(trendType.rawValue.lowercased()) information right now.")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
            }
        }
    }
}

#Preview {
    TrendDetailsView(
        trendType: .accuracy,
        trend: nil
    )
}
