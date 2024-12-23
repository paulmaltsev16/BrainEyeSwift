//
//  TrendsViewModel.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

import Foundation

class TrendsViewModel: ObservableObject {
    
    @Published var accuracyTrend: Trend? = nil
    @Published var reactionTimeTrend: Trend? = nil

    private var task: Task<Void, Never>? = nil
    
    init() {
        getTrends()
    }
    
    deinit {
        task?.cancel()
    }
    
    private func getTrends() {
        task = Task {
            let result = await GetTrendsUseCase().invoke()
            switch result {
            case .success(let value):
                await handleTrendsResult(value)
            case .failure(_):
                print("Something went wrong")
            }
        }
    }
    
    private func handleTrendsResult(_ trends: Trends?) async {
        guard let trends else {
            return
        }
        
        let accuracy = trends.trends?.first { $0.scoreType == "accuracy" }
        let reactionTime = trends.trends?.first { $0.scoreType == "reaction_time" }
        
        await MainActor.run {
            accuracyTrend = accuracy
            reactionTimeTrend = reactionTime
        }
    }
}
