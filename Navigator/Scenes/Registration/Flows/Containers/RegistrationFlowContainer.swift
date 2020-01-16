//
//  RegistrationFlowContainer.swift
//  Navigator
//
//  Created by Milan de Ruiter on 16/01/2020.
//  Copyright © 2020 ABN. All rights reserved.
//

import Foundation
import Swinject

class RegistrationFlowResolver {
    
    static var container: Container {
        let container = Container()
        
        container.register(CreateAccountViewController.self) { (resolver, delegate: RegistrationFlowCoordinator) -> CreateAccountViewController in
            let viewController = CreateAccountViewController()
            viewController.delegate = delegate
            return viewController
        }
        
        container.register(CreatePasswordViewController.self) { (resolver, delegate: RegistrationFlowCoordinator) -> CreatePasswordViewController in
            let viewController = CreatePasswordViewController()
            viewController.delegate = delegate
            return viewController
        }
        
        return container
    }
}
