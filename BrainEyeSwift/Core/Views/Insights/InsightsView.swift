//
//  InsightsView.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

import SwiftUI

struct InsightsView: View {
    
    let insight: Insight
    let unit: String
    
    var body: some View {
        HStack {
            InsightItem(
                title:"Latest",
                value: "\(insight.latest ?? 0)",
                unit: unit
            )
            
            Spacer()
            
            InsightItem(
                title: "Average",
                value: "\(insight.average ?? 0)",
                unit: unit
            )
            
            Spacer()
            
            InsightItem(
                title: "Range",
                value: insight.range?.displayedTitle ?? "-",
                unit: unit
            )
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}

private struct InsightItem: View {
    let title: String
    let value: String
    let unit: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
            
            Text(value + unit)
                .font(.headline)
        }
    }
}

#Preview {
    InsightsView(
        insight: Insight(
            average: 90,
            latest: 89,
            range: Range(
                lowerBound: 82,
                upperBound: 98
            )
        ),
        unit: "%"
    )
}
