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
    
    private static let pickerStringKey = "Tabs"
    @State private var selectedTab: TrendType = .accuracy
    
    let accuracyTrend: Trend?
    let reactionTimeTrend: Trend?
    
    var body: some View {
        VStack {
            Picker(ContentView.pickerStringKey, selection: $selectedTab) {
                ForEach(TrendType.allCases, id: \.self) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(maxHeight: 55)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
            
            TabView(selection: $selectedTab) {
                TrendDetailsView(
                    trendType: .accuracy,
                    trend: accuracyTrend
                )
                .padding()
                .tag(TrendType.accuracy)
                
                TrendDetailsView(
                    trendType: .responseTime,
                    trend: reactionTimeTrend
                )
                .padding()
                .tag(TrendType.responseTime)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

#Preview {
    TrendsView()
}
