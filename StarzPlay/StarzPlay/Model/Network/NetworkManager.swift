//
//  NetworkManager.swift
//  WayFairAssessment
//
//  Created by Usama Inaam Rasheed on 2/28/24.
//

import Foundation

class NetworkManager {
    
    /// Singleton Network class to manage API Calls
    static let sharedService = NetworkManager()
    private init() {}
    
    func getDataFrom(url: String, completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = URL(string: url) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                if let nsError = error as NSError?, nsError.code == NSURLErrorTimedOut {
                    completion(.failure(NetworkError.timeout))
                } else {
                    completion(.failure(error))
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
    
    enum NetworkError: Error {
        case invalidURL
        case invalidResponse
        case noData
        case timeout
    }
}
