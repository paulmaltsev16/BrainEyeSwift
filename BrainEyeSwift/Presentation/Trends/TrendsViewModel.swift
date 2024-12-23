//
//  TrendsViewModel.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

import Foundation

class TrendsViewModel: ObservableObject {
    
    @Published var trends: Trends? = nil
    private var task: Task<Void, Never>? = nil
    
    init() {
        getTrends()
    }
    
    private func getTrends() {
        task = Task {
            let result = await GetTrendsUseCase().invoke()
            switch result {
            case .success(let value):
                await MainActor.run { trends = value }
                
            case .failure(_):
                print("Something went wrong")
            }
        }
    }
}
