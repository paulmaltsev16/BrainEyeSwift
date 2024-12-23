//
//  TrendsView.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

import SwiftUI

struct TrendsView: View {
    
    @ObservedObject private var viewModel = TrendsViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.state {
                
            case .loading:
                ProgressView()
                
            case .loaded:
                ContentView(
                    accuracyTrend: viewModel.accuracyTrend,
                    reactionTimeTrend: viewModel.reactionTimeTrend
                )
                
            case .error:
                Text("Unable to download data. Please check your internet connection and try again.")
            }
        }
        .navigationTitle("Trends")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { exit(0) }) {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.primary)
                }
            }
        }
    }
}

private struct ContentView: View {
    
    @State private var selectedTab: TrendType = .accuracy
    
    let accuracyTrend: Trend?
    let reactionTimeTrend: Trend?
    
    var body: some View {
        Picker("Tabs", selection: $selectedTab) {
            Text(TrendType.accuracy.rawValue).tag(TrendType.accuracy)
            Text(TrendType.responseTime.rawValue).tag(TrendType.responseTime)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        
        switch selectedTab {
            
        case .accuracy:
            TrendDetailsView(
                trendType: .accuracy,
                trend: accuracyTrend
            )
        case .responseTime:
            TrendDetailsView(
                trendType: .responseTime,
                trend: reactionTimeTrend
            )
        }
    }
}

#Preview {
    TrendsView()
}
