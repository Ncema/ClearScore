//
//  ScorePresenter.swift
//  ClearScore
//
//  Created by Rider on 2026/04/11.
//

import Foundation

class ScorePresenter: ScorePresentable {
    
    var view: ScorePresenterViewable?
    var interactor: ScoreInteractor?
    
    func fetchScore() {
        self.interactor?.fetchScore()
    }
    
    func getScoreSuccess(object: ScoreResponseModel) {
        let model = self.transformToModel(object: object)
        self.view?.fetchScoreSuccess(score: model)
    }
    
    func getScoreFailure(error: String) {
        self.view?.fetchScoreFailure(error: error)
    }
    
    
    
    //MARK: - Transform to model
    func transformToModel(object: ScoreResponseModel) -> ScoreModel {
        let model = ScoreModel()
        model.creditReportInfo = CreditReportInfoModel()
        
        model.creditReportInfo?.score = object.creditReportInfo?.score
        model.creditReportInfo?.maxScoreValue = object.creditReportInfo?.maxScoreValue
        model.creditReportInfo?.hasEverDefaulted = object.creditReportInfo?.hasEverDefaulted
        model.creditReportInfo?.currentShortTermDebt = object.creditReportInfo?.currentShortTermDebt
        model.creditReportInfo?.monthsSinceLastDefaulted = object.creditReportInfo?.monthsSinceLastDefaulted
        model.creditReportInfo?.currentShortTermDebt = object.creditReportInfo?.currentShortTermDebt
        model.creditReportInfo?.changeInShortTermDebt = object.creditReportInfo?.changeInShortTermDebt
       model.creditReportInfo?.currentLongTermDebt = object.creditReportInfo?.currentLongTermDebt
        return model
    }
}
