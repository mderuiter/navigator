//
//  CreateAccountViewController.swift
//  Navigator
//
//  Created by Milan de Ruiter on 16/01/2020.
//  Copyright © 2020 ABN. All rights reserved.
//

import UIKit

protocol CreateAccountViewControllerDelegate: class {
    func didCreateUser(named name: String?)
}

class CreateAccountViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    
    // MARK: - Properties
    weak var delegate: CreateAccountViewControllerDelegate?
    
    // MARK: - IBActions
    @IBAction func actionButtonTapped(_ sender: Any) {
        let username = usernameTextField.text
        delegate?.didCreateUser(named: username)
    }
}
