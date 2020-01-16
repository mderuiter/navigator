//
//  FlowCoordinatorProtocol.swift
//  Navigator
//
//  Created by Milan de Ruiter on 16/01/2020.
//  Copyright © 2020 ABN. All rights reserved.
//

import UIKit

protocol FlowCoordinatorProtocol: class {
    
    /// Reference to the root of the flow
    var rootViewController: UIViewController? { get }
    
    /// Starts the flow on op of the presenting viewController.
    func startFlow(presenting viewController: UIViewController)
    
    /// Starts the flow in the given navigation stack.
    func startFlow(in navigation: UINavigationController)
}

extension FlowCoordinatorProtocol {
    
    func startFlow(presenting presentingViewController: UIViewController) {
        if let rootViewController = rootViewController {
            let navigationController = UINavigationController(rootViewController: rootViewController)
            presentingViewController.present(navigationController, animated: true)
        }
    }
    
    func startFlow(in navigationController: UINavigationController) {
        if let rootViewController = rootViewController {
            navigationController.pushViewController(rootViewController, animated: true)
        }
    }
}
