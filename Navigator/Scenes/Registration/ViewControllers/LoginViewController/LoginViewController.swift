//
//  LoginViewController.swift
//  Navigator
//
//  Created by Milan de Ruiter on 16/01/2020.
//  Copyright © 2020 ABN. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Properties
    private var coordinator: FlowCoordinatorProtocol?
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction func registerButtonPressed(_ sender: Any) {
        self.coordinator = RegistrationFlowCoordinator(presentingViewController: self)
        self.coordinator?.startFlow()
    }
}
