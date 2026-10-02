//
//  WireframeDelegate.swift
//  ClearScore
//
//  Created by Rider on 2026/05/03.
//

import UIKit

protocol WireframeDelegate {
    func transitionToClearScoreViewController(controller: UIViewController,viewModel: ClearScoreViewModel?)
    func transitionToScoreDetailViewController(controller: UIViewController, viewModel: ClearScoreViewModel?)
}
