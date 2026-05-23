//
//  BusyIndicator.swift
//  ClearScore
//
//  Created by Rider on 2026/04/11.
//

import Foundation
import UIKit
import Lottie


private var boatAnimation: LottieAnimationView?

extension UIViewController {
    
    func showBusyView() {
        let animationView = LottieAnimationView(name: "loader")

        animationView.frame = view.bounds
        animationView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        animationView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit

        view.addSubview(animationView)

        animationView.play()

        boatAnimation = animationView
    }
    
    func hideBusyView() {
        DispatchQueue.main.async {
            if self.view.isUserInteractionEnabled  == false {
                self.view.isUserInteractionEnabled = true
            }
            boatAnimation?.stop()
            boatAnimation?.removeFromSuperview()
        }
    }
}
