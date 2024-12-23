//
//  GetTrendsUseCase.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

import Foundation

class GetTrendsUseCase {
    private let repository: TrendsRepository
    
    init(_ repository: TrendsRepository = TrendsRepositoryImpl()) {
        self.repository = repository
    }
    
    func invoke() async -> Result<Trends, Error> {
        return await repository.getTrends()
    }
}
