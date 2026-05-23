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
        
        //Convert string path into a valid URL
        guard let url = URL(string: path) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1)))
            return
        }
        
        //Create and start a network request using URLSession
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            // Check if request failed (network error, no internet, etc.)
            if let error = error {
                completion(.failure(error))
                return
            }
            
            //Check if server returned data
            guard let data = data else {
                completion(.failure(NSError(domain: "NoData", code: -1)))
                return
            }
            
            // Try to decode JSON into your model
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
                
            } catch {
                completion(.failure(error))
            }
        }.resume() //Start the network request
    }
}
