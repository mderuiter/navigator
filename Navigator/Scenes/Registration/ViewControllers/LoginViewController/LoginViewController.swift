//
//  LoginViewController.swift
//  Navigator
//
//  Created by Milan de Ruiter on 16/01/2020.
//  Copyright © 2020 ABN. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var welcomeLabel: UILabel!
    
    // MARK: - Properties
    private var coordinator: FlowCoordinatorProtocol?
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction func registerButtonPressed(_ sender: Any) {
        self.coordinator = RegistrationFlowCoordinator(presentingViewController: self, completion: showWelcomeTextFor(userName:password:))
        self.coordinator?.startFlow()
    }
    
    // MARK: - Utilities
    private func showWelcomeTextFor(userName : String?, password: String?) {
        if let name = userName, let password = password {
            self.welcomeLabel.text = "Hello \(name)!\nPassword is set to: \(password)"
        }
    }
}
