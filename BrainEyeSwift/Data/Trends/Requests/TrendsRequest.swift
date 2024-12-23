//
//  TrendsRequest.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

struct TrendsRequest: HttpRequest {
    typealias ReturnType = Trends
    
    var endpoint: String = "/!api/2.0/snippets/bioeye/XEzd9A/93bef03b9da174624870d48d08aaa29fec5da78f/files/snippet.json"
    
    var httpMethod: HttpMethod = .get
    
    var headers: [String : String]?
    
    var params: [String : Any]?
}
