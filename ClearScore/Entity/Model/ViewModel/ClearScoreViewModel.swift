//
//  ClearScoreViewModel.swift
//  ClearScore
//
//  Created by Rider on 2026/05/31.
//

import Foundation

final class ClearScoreViewModel {

    private let service: DataServiceProtocol

    var scoreModel: ScoreResponseModel?

    var onScoreLoaded: (() -> Void)?
    var onError: ((String) -> Void)?

    init(service: DataServiceProtocol) {
        self.service = service
    }

    func fetchScore() {

        service.fetchData(path: Path.getScore.rawValue) {
            [weak self] (result: Result<ScoreResponseModel, Error>) in

            DispatchQueue.main.async {

                switch result {

                case .success(let response):
                    self?.scoreModel = response
                    self?.onScoreLoaded?()

                case .failure:
                    self?.onError?("Technical Error")
                }
            }
        }
    }
}
