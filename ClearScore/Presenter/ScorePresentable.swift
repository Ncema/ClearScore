//
//  ScorePresentable.swift
//  ClearScore
//
//  Created by Rider on 2026/04/11.
//

import Foundation

protocol ScorePresentable {
    
    var view: ScorePresenterViewable? { set get }
    
    
    //MARK: - Input
    func fetchScore()
    
    //MARK: - Output
    func getScoreSuccess(object: ScoreResponseModel)
    func getScoreFailure(error: String)
}
