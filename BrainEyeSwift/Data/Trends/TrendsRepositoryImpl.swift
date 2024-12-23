//
//  TrendsRepositoryImpl.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

import Foundation

class TrendsRepositoryImpl: TrendsRepository {
    func getTrends() async -> Result<Trends, any Error> {
        let request = TrendsRequest()
        return await NetworkManager.shared.makeRequest(request)
    }
}
