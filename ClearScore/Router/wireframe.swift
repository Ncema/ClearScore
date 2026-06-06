//
//  wireframe.swift
//  ClearScore
//
//  Created by Rider on 2026/05/03.
//

import Foundation
import UIKit
class Wireframe: WireframeDelegate {
    
    static let shared = Wireframe()
    var wireframe: WireframeDelegate?
    func transitionToClearScoreViewController(controller: UIViewController,viewModel: ClearScoreViewModel?) {
        self.wireframe = Wireframe()
        let newController = ClearScoreViewController(viewModel: viewModel)
        newController.wireframe = self.wireframe
        let navigationController = UINavigationController(rootViewController: newController)
        navigationController.modalPresentationStyle = .fullScreen
        controller.navigationController?.pushViewController(newController, animated: true)
    }
    
    func transitionToScoreDetailViewController(controller: UIViewController, viewModel: ClearScoreViewModel?) {
        let newController = ScoreDetailViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: newController)
        navigationController.modalPresentationStyle = .fullScreen
        controller.navigationController?.pushViewController(newController, animated: true)
    }
}
