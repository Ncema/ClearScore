//
//  NavigationBar.swift
//  ClearScore
//
//  Created by Rider on 2026/05/03.
//

import UIKit


extension UIViewController {
    
   
    func setUpNavigationBar(title: String?) {

        self.navigationItem.title = title

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .semibold)
        ]

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .black

        let backImage = UIImage(systemName: "chevron.left")
        let leftBackButton = UIBarButtonItem(image: backImage,style: .plain,target: self,action: #selector(popViewAnimated))

        leftBackButton.imageInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        self.navigationItem.leftBarButtonItem = leftBackButton
    }
    
    @objc func popViewAnimated() {
        navigationController?.popViewController(animated: true)
    }
}
