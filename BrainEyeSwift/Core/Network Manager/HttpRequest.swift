//
//  HttpRequest.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

protocol HttpRequest {
    
    associatedtype ReturnType: Decodable

    var endpoint: String { get }
    
    var httpMethod: HttpMethod { get }
    
    var headers: [String: String]? { get }
    
    var params: [String: Any]? { get }
    
}
