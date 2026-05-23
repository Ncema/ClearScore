//
//  ScoreModel.swift
//  ClearScore
//
//  Created by Rider on 2026/04/11.
//

import Foundation


class ScoreModel {
    var accountIDVStatus: String?
    var creditReportInfo: CreditReportInfoModel?
    var dashboardStatus: String?
    var coachingSummary: CoachingSummaryModel?
    var augmentedCreditScore: Int?
}

class CreditReportInfoModel {
    var score: Int?
    var scoreBand: Int?
    var clientRef: String?
    var status: String?
    var maxScoreValue: Int?
    var minScoreValue: Int?
    var monthsSinceLastDefaulted: Int?
    var hasEverDefaulted: Bool?
    var monthsSinceLastDelinquent: Int?
    var hasEverBeenDelinquent: Bool?
    var percentageCreditUsed: Int?
    var percentageCreditUsedDirectionFlag: Int?
    var changedScore: Int?
    var currentShortTermDebt: Int?
    var changeInShortTermDebt: Int?
    var currentLongTermDebt: Int?
    var currentShortTermNonPromotionalDebt: Int?
    var currentShortTermCreditUtilisation: Int?
    var changeInLongTermDebt: Int?
    var numPositiveScoreFactors: Int?
    var equifaxScoreBand: Int?
    var equifaxScoreBandDescription: String?
    var daysUntilNextReport: Int?
}

class CoachingSummaryModel {
    var activeTodo: Bool?
    var activeChat: Bool?
    var numberOfTodoItems: Int?
    var numberOfCompletedTodoItems: Int?
    var selected: Bool?
}
