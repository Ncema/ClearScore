//
//  DependencyContainer.swift
//  ClearScore
//
//  Created by Rider on 2026/04/11.
//

import Foundation

 struct DependencyContainer {
    
    static func makeScoreModule() -> ScorePresentable {
        
        // 1. Create all object
        let service = DataService()
        let presenter = ScorePresenter()
        let interactor = ScoreInteractor(service: service,presenter: presenter)
       
        // 2. Wire everything together

        presenter.interactor = interactor
       
        // 3. Return fully built module
        return presenter
    }
}
