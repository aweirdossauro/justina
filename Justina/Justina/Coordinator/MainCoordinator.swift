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
            vc.delegate = self
            
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
    
    
    func showOnboarding(){
        DispatchQueue.main.async {
            let vc = OnboardingVC.instantiate()
            vc.delegate = self
            self.navigationController.present(vc, animated: true)
        }
    }
}

//Telas relacionadas ao flow de petição
extension MainCoordinator {
    func showPersonalData(){
        DispatchQueue.main.async {
            let vc = PersonalDataVC.instantiate()
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
    
    func showContactInfo(){
        DispatchQueue.main.async {
            let vc = ContactInfoVC.instantiate()
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
    
    func showCompanyData(){
        DispatchQueue.main.async {
            let vc = CompanyDataVC.instantiate()
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
}

extension MainCoordinator: MainVCDelegate {
    
    func mainVCDidFinish() {
//        delegate?.mainCoordinatorDidFinish()
        presentNewPetitionFlow()
    }

    func moveToPersonalData() {
        showPersonalData()
    }
    
    func moveToProcessosInfo() {
        showProcessosInfoVC()
    }
    
    func moveToOnboarding() {
        showOnboarding()
    }
    
    func presentNewPetitionFlow(){
        let navigationController = UINavigationController()
        navigationController.navigationBar.isHidden = true
        navigationController.isModalInPresentation = true
        
        let dataCoordinator = DataCoordinator(navigationController: navigationController)
        self.navigationController.present(dataCoordinator.navigationController, animated: true, completion: nil)
    }
}

extension MainCoordinator: OnboardingVCDelegate {
    func onboardingVCDidFinish() {
        self.navigationController.dismiss(animated: true, completion: nil)
    }
}

extension MainCoordinator: PeticaoProcessosVCDelegate {
    func peticaoProcessosVCDidFinish() {
        self.navigationController.dismiss(animated: true, completion: nil)
    }
}
