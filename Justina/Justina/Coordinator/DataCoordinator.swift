//
//  DataCoordinator.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 10/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

protocol DataCoordinatorDelegate: AnyObject {
    func dataCoordinatorDidFinish()

}
class DataCoordinator: NavigationCoordinator {
    
//    let childCoordinators: [Coordinator]
    var navigationController: UINavigationController

    weak var delegate: DataCoordinatorDelegate?

    init(navigationController : UINavigationController) {
        // Creates the NavigationController
        self.navigationController = navigationController
        
        // Sets the Navigation Bar default properties
        setDefaultProperties()
    }
    
    func start() {
        showPersonalData()
    }

    func showPersonalData(){
        DispatchQueue.main.async {
            let vc = PersonalDataVC.instantiate()
            vc.delegate = self
            self.navigationController.pushViewController(vc, animated: true)
        }
    }

}

extension DataCoordinator: PersonalDataVCDelegate {
    /**
     
     */
    func personalDataVCDidFinish() {
        delegate?.dataCoordinatorDidFinish()
    }

}
