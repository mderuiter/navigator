//
//  SceneDelegate.swift
//  Navigator
//
//  Created by Milan de Ruiter on 16/01/2020.
//  Copyright © 2020 ABN. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Properties
    var window: UIWindow?
    
    // MARK: - UIWindowSceneDelegate
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if let windowScene = scene as? UIWindowScene {
            window = UIWindow(windowScene: windowScene)
            
            let navigationController = RegisterViewController()
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }
    }
}
