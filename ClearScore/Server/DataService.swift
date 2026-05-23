//
//  DataService.swift
//  ClearScore
//
//  Created by Rider on 2026/04/11.
//

import Foundation

final class DataService: DataServiceProtocol {
    // func fetchData(path: String,completion: @escaping (Result<T, Error>) -> Void)
    func fetchData<T: Decodable>(path: String,completion: @escaping (Result<T, Error>) -> Void){
        
        // 1. Convert string path into a valid URL
        guard let url = URL(string: path) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1)))
            return
        }
        
        // 2. Create and start a network request using URLSession
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            // 3. Check if request failed (network error, no internet, etc.)
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // 4. Check if server returned data
            guard let data = data else {
                completion(.failure(NSError(domain: "NoData", code: -1)))
                return
            }
            
            // 5. Try to decode JSON into your Swift model
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                
                // 6. Return success with decoded model
                completion(.success(decodedData))
                
            } catch {
                // 7. If decoding fails, return error
                completion(.failure(error))
            }
        }.resume() // 8. Start the network request
    }
}
