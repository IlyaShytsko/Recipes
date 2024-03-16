//
//  UIViewController.swift
//  RecipesCodingChallenge
//
//  Created by Ilya Shytsko on 15.03.24.
//

import UIKit

extension UIViewController {
    func showAlert(title: String?, message: String?, handler: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel) { _ in
                handler?()
            })
            self.present(alert, animated: true)
        }
    }
    
    func showError(_ error: Error, handler: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "", message: error.description, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel) { _ in
                handler?()
            })
            self.present(alert, animated: true)
        }
    }
}
