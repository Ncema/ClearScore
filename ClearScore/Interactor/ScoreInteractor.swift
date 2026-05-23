//
//  ScoreInteractor.swift
//  ClearScore
//
//  Created by Rider on 2026/04/11.
//

import Foundation

class ScoreInteractor: ScoreInteractable {
    
    // 1. Networking layer (DataService)
    var service: DataServiceProtocol
    
    // 2. presenter (to send results to UI layer)
    var presenter: ScorePresenter
    
    // 3. Initializer (dependency injection)
    init(service: DataServiceProtocol,presenter: ScorePresenter) {
        self.service = service
        self.presenter = presenter
    }
    
    // 4. Called by the Presenter to start fetching data
    func fetchScore() {
        // 5. Ask the service to get data from API
        self.service.fetchData(path: Path.getScore.rawValue) { [weak self] (result: Result<ScoreResponseModel, Error>) in
            
            // 6. Prevent memory leaks (avoid strong reference cycle)
            guard let self = self else { return }
            
            // 7. Handle success or failure from service
            switch result {
                
            case .success(let response):
                // 8. SUCCESS -> send data to presenter
                self.presenter.getScoreSuccess(object: response)
                
            case .failure(let error):
                // 9. FAILURE -> send error to presenter
                self.presenter.getScoreFailure(error: error.localizedDescription)
            }
        }
    }
}
