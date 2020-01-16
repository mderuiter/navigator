//
//  RegistrationFlowCoordinator.swift
//  Navigator
//
//  Created by Milan de Ruiter on 16/01/2020.
//  Copyright © 2020 ABN. All rights reserved.
//

import UIKit
import Swinject

class RegistrationFlowCoordinator: FlowCoordinatorProtocol {
    
    // MARK: - Aliasses
    typealias FlowCompletionType = ((String?, String?) -> Void)
    
    // MARK: - Properties
    private let presentingViewController: UIViewController
    private var navigationController: UINavigationController?
    private var flowCompletion: FlowCompletionType?
    private var container: Container?
    
    // MARK: - DataStore
    private var username: String?
    private var password: String?
    
    // MARK: - Initializers
    init(presentingViewController: UIViewController,
         container: Container = RegistrationFlowResolver.container,
         completion: @escaping FlowCompletionType) {
        
        self.container = container
        self.presentingViewController = presentingViewController
        self.flowCompletion = completion
    }
    
    func startFlow() {
        if let viewController = container?.resolve(CreateAccountViewController.self, argument: self) {
            self.navigationController = UINavigationController(rootViewController: viewController)
            self.presentingViewController.present(navigationController!, animated: true)
        }
    }
        
    // MARK: - Flows
    private func showCreatePassword() {
        if let createPasswordViewController = container?.resolve(CreatePasswordViewController.self, argument: self) {
            self.navigationController?.pushViewController(createPasswordViewController, animated: true)
        }
    }
}

extension RegistrationFlowCoordinator: CreateAccountViewControllerDelegate {
    
    func didCreateUser(named name: String?) {
        self.username = name
        self.showCreatePassword()
    }
}

extension RegistrationFlowCoordinator: CreatePasswordViewControllerDelegate {
    
    func didCreatePassword(_ password: String?) {
        self.password = password
        
        self.flowCompletion?(username, password)
        self.navigationController?.dismiss(animated: true)
    }
}
