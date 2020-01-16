//
//  RegistrationFlowCoordinator.swift
//  Navigator
//
//  Created by Milan de Ruiter on 16/01/2020.
//  Copyright © 2020 ABN. All rights reserved.
//

import UIKit

class RegistrationFlowCoordinator: FlowCoordinatorProtocol {
    
    // MARK: - Properties
    let presentingViewController: UIViewController
    var navigationController: UINavigationController?
    
    private var username: String?
    private var password: String?
    
    // MARK: - Initializers
    init(presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
    }
    
    func startFlow() {
        let createAccountViewController = CreateAccountViewController()
        createAccountViewController.delegate = self
        self.presentingViewController.present(createAccountViewController, animated: true)
    }
    
    private func showCreatePassword() {
        
    }
}

extension RegistrationFlowCoordinator: CreateAccountViewControllerDelegate {
    
    func didCreateUser(named name: String?) {
        self.username = name
        self.showCreatePassword()
    }
}
