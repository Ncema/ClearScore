//
//  DataServiceProtocol.swift
//  ClearScore
//
//  Created by Rider on 2026/04/11.
//

import Foundation

protocol DataServiceProtocol {
    func fetchData<T: Decodable>(path: String,completion: @escaping (Result<T, Error>) -> Void)
}
