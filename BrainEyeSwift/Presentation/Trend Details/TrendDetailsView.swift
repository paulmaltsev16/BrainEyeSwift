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
            if let trend {
                GraphView(
                    title: "\(trendType.rawValue) (\(trend.unit?.unitDisplayType ?? ""))",
                    subTitle: trend.scorePoints?.measurePeriod ?? "",
                    data: [1,10,3],
                    normalRange: (0, 100)
                )
                .frame(maxHeight: .infinity)
                
                if let insight = trend.insight {
                    InsightsView(
                        insight: insight,
                        unit: trend.unit?.unitDisplayType ?? ""
                    )
                }
            }
            else {
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
