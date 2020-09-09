//
//  MainCoordinator.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 01/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class MainCoordinator: NavigationCoordinator {
    
    var navigationController: UINavigationController
    
    init() {
        // Creates the NavigationController
        navigationController = UINavigationController()
        
        // Sets the Navigation Bar default properties
        setDefaultProperties()
        
        start()
    }
    
    func start() {
        DispatchQueue.main.async {
            let mainVC = MainVC.instantiate()
            mainVC.coordinator = self
            self.navigationController.pushViewController(mainVC, animated: true)
        }

    }

}
