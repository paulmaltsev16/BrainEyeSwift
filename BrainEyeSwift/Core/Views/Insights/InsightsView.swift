//
//  InsightsView.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

import SwiftUI

private let dividerHeight: CGFloat = 50

struct InsightsView: View {
    
    let insight: Insight
    let unit: String
    
    var body: some View {
        VStack {
            Text("Insights")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
            
            HStack {
                InsightItem(
                    title:"Latest",
                    value: "\(insight.latest ?? 0)",
                    unit: unit
                )
                
                Divider()
                    .frame(height: dividerHeight)
                
                InsightItem(
                    title: "Average",
                    value: "\(insight.average ?? 0)",
                    unit: unit
                )
                
                Divider()
                    .frame(height: dividerHeight)
                
                InsightItem(
                    title: "Range",
                    value: insight.range?.displayedTitle ?? "-",
                    unit: unit
                )
            }
            .padding()
            .background(Color.gray.opacity(0.3))
            .cornerRadius(12)
        }
    }
}

private struct InsightItem: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    let title: String
    let value: String
    let unit: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
            
            Text(value + unit)
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .font(.headline)
        }
        .frame(maxWidth: .infinity)
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
