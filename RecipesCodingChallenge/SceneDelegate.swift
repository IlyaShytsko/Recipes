//
//  SceneDelegate.swift
//  RecipesCodingChallenge
//
//  Created by Ilya Shytsko on 14.03.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let viewController = SearchViewController.instance()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}
