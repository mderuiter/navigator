//
//  CreatePasswordViewController.swift
//  Navigator
//
//  Created by Milan de Ruiter on 16/01/2020.
//  Copyright © 2020 ABN. All rights reserved.
//

import UIKit

protocol CreatePasswordViewControllerDelegate: class {
    func didCreatePassword(_ password: String?)
}

class CreatePasswordViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Properties
    weak var delegate: CreatePasswordViewControllerDelegate?
    
    // MARK: - IBActions
    @IBAction func actionButtonTapped(_ sender: Any) {
        let password = passwordTextField.text
        delegate?.didCreatePassword(password)
    }
}
