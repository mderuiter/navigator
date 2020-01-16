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
    
    // MARK: - Properties
    private let presentingViewController: UIViewController
    private var navigationController: UINavigationController?
    private var flowCompletion: ((String) -> Void)
    private var container: Container?
    
    // MARK: - DataStore
    private var username: String?
    private var password: String?
    
    // MARK: - Initializers
    init(presentingViewController: UIViewController, completion: @escaping (String) -> Void) {
        self.container = RegistrationFlowResolver.container
        self.presentingViewController = presentingViewController
        self.flowCompletion = completion
    }
    
    func startFlow() {
        if let createAccountViewController = container?.resolve(CreateAccountViewController.self) {
            createAccountViewController.delegate = self
            let navigationController = UINavigationController(rootViewController: createAccountViewController)
            self.navigationController = navigationController
            self.presentingViewController.present(navigationController, animated: true)
        }
    }
    
    func endFlow() {
        let name = username ?? "John Doe"
        self.flowCompletion(name)
        self.navigationController?.dismiss(animated: true)
    }
    
    // MARK: - Flows
    private func showCreatePassword() {
        let createPasswordViewController = CreatePasswordViewController()
        createPasswordViewController.delegate = self
        self.navigationController?.pushViewController(createPasswordViewController, animated: true)
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
        self.endFlow()
    }
}
