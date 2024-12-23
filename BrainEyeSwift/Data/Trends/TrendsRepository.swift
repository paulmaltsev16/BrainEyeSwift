//
//  TrendsRepository.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

import Foundation

protocol TrendsRepository {
    func getTrends() async -> Result<Trends, Error>
}
