//
//  MainCoordinator.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 01/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

protocol MainCoordinatorDelegate: AnyObject {
    func mainCoordinatorDidFinish()

}

class MainCoordinator: NavigationCoordinator {
    
//    let childCoordinators: [Coordinator]
    var navigationController: UINavigationController

    weak var delegate: MainCoordinatorDelegate?

    init(navigationController : UINavigationController) {
        // Creates the NavigationController
        self.navigationController = navigationController
        
        // Sets the Navigation Bar default properties
        setDefaultProperties()
    }
    
    func start() {
        showMainVC()
    }

    func showMainVC(){
        DispatchQueue.main.async {
            let vc = MainVC.instantiate()
            vc.delegate = self
            
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
    
    func showProcessosInfoVC(){
        DispatchQueue.main.async {
            let vc = ProcessosInfoVC.instantiate()
//            vc.delegate = self
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
    
    func showPersonalData(){
        DispatchQueue.main.async {
            let vc = PersonalDataVC.instantiate()
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
    
    func showOnboarding(){
        DispatchQueue.main.async {
            let vc = OnboardingVC.instantiate()
            vc.delegate = self
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
}

extension MainCoordinator: MainVCDelegate {
    /**
     
     */
    func mainVCDidFinish() {
        delegate?.mainCoordinatorDidFinish()
    }

    func moveToPersonalData() {
        showPersonalData()
    }
    
    func moveToProcessosInfo() {
        showProcessosInfoVC()
    }
    
    func moveToOnboarding() {
        showOnboarding()()
    }
}
