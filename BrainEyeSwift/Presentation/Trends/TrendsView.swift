//
//  TrendsView.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

import SwiftUI

enum TrendType: String {
    case accuracy = "Accuracy"
    case responseTime = "Response Time"
}

struct TrendsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var viewModel = TrendsViewModel()
    @State private var selectedTab: TrendType = .accuracy
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Tabs", selection: $selectedTab) {
                    Text(TrendType.accuracy.rawValue).tag(TrendType.accuracy)
                    Text(TrendType.responseTime.rawValue).tag(TrendType.responseTime)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Spacer()
                
                switch selectedTab {
                    
                case .accuracy:
                    TrendDetailsView(
                        trendType: .accuracy,
                        trend: viewModel.accuracyTrend
                    )
                case .responseTime:
                    TrendDetailsView(
                        trendType: .responseTime,
                        trend: viewModel.reactionTimeTrend
                    )
                }
                
                Spacer()
            }
            .navigationTitle("Trends")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.primary)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    TrendsView()
}
