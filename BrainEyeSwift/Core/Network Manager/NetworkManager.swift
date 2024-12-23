//
//  NetworkManager.swift
//  BrainEyeSwift
//
//  Created by Paul on 23/12/2024.
//

import Foundation

private enum NetworkError: Error {
    case nullableUrlRequest
    case invalidResponse
    case requestFailed
    case dataIsEmpty
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func makeRequest<T: HttpRequest>(_ request: T) async -> Result<T.ReturnType, Error> {
        guard let urlRequest = createUrlRequest(request) else {
            print("Can't create URLRequest, instance is nil.")
            return .failure(NetworkError.nullableUrlRequest)
        }
        
        do {
            let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
            
            guard let response = urlResponse as? HTTPURLResponse else  {
                return .failure(NetworkError.invalidResponse)
            }
            
            if response.statusCode != 200 {
                return .failure(NetworkError.requestFailed)
            }
            
            if data.isEmpty {
                return .failure(NetworkError.dataIsEmpty)
            }
            
            let decodedData = try JSONDecoder().decode(T.ReturnType.self, from: data)
            return .success(decodedData)
        } catch {
            return .failure(error)
        }
    }
    
    private func createUrlRequest(_ request: any HttpRequest) -> URLRequest? {
        let fullUrl = Constants.baseUrl + request.endpoint
        
        guard let url = URL(string: fullUrl) else {
            print("Can't create URL instance from \(fullUrl).")
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpMethod = request.httpMethod.rawValue
        return urlRequest
    }
}
