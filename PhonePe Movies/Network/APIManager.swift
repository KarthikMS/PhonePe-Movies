//
//  APIManager.swift
//  PhonePe Movies
//
//  Created by Karthik Maharajan Skandarajah on 24/09/2023.
//

import Foundation

enum APIError: Error {
    case networkError
    case parsingError
    case invalidRequest
}


protocol APIManaging {
    func execute<Value: Decodable>(_ request: Request<Value>, completion: @escaping (Result<Value, APIError>) -> Void)
}


final class APIManager: APIManaging {

    // MARK: - Constants
    
    private let host = "https://api.themoviedb.org/3"
    private let apiKey = "38a73d59546aa378980a88b645f487fc"
    
    // MARK: - Init
    
    static let shared = APIManager()
    
}

// MARK: - APIManaging

extension APIManager {
    
    func execute<Value: Decodable>(_ request: Request<Value>, completion: @escaping (Result<Value, APIError>) -> Void) {
        guard let request = urlRequest(for: request) else {
            completion(.failure(.invalidRequest))
            return
        }
        
        URLSession.shared.dataTask(with: request) { responseData, response, _ in
            guard let data = responseData else {
                completion(.failure(.networkError))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(Value.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(.parsingError))
            }
        }.resume()
    }
    
    private func urlRequest<Value>(for request: Request<Value>) -> URLRequest? {
        guard let url = URL(string: host)?.appendingPathComponent(request.path),
              var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil }
        components.queryItems = (components.queryItems ?? []) + [URLQueryItem(name: "api_key", value: apiKey)]
        
        guard let urlWithComponents = components.url,
              let finalURL = URL(string: urlWithComponents.absoluteString) else { return nil }
        
        var result = URLRequest(url: finalURL)
        result.httpMethod = request.method.rawValue
        result.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return result
    }
    
}
