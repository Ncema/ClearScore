//
//  Alert.swift
//  ClearScore
//
//  Created by Rider on 2026/05/25.
//
import UIKit

extension UIViewController {

    func showErrorMessage(title: String,message: String) {

        let alert = UIAlertController(title: title,message: message,preferredStyle: .alert)

        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default
        ))

        present(alert, animated: true)
    }
}
