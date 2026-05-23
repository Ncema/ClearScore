//
//  ScorePresenterViewable.swift
//  ClearScore
//
//  Created by Rider on 2026/04/11.
//

import Foundation

protocol ScorePresenterViewable {
    func fetchScoreSuccess(score: ScoreModel)
    func fetchScoreFailure(error: String)
}
