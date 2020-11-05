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
    weak var window: UIWindow?

    init(navigationController : UINavigationController, window: UIWindow?
) {
        // Creates the NavigationController
        self.navigationController = navigationController
        self.window = window
        // Sets the Navigation Bar default properties
        setDefaultProperties()
    }
    
    func start(_ isRoot : Bool = false) {
        showPersonalData(isRoot)
    }
    
    func showPersonalData(_ isRoot : Bool = false){
        DispatchQueue.main.async {
            let vc = PersonalDataVC.instantiate()
            vc.delegate = self
            
            if isRoot {
                self.window?.rootViewController = vc
                self.window?.makeKeyAndVisible()
                return
            }
            
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
    
    func showContactInfo(){
        DispatchQueue.main.async {
            let vc = ContactInfoVC.instantiate()
            vc.delegate = self
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
    
    func showCompanyData(){
        DispatchQueue.main.async {
            let vc = CompanyDataVC.instantiate()
            vc.delegate = self
            self.navigationController.pushViewController(vc, animated: true)
        }
    }

}

extension DataCoordinator: PersonalDataVCDelegate {
    
    func personalDataVCDidFinish() {
        delegate?.dataCoordinatorDidFinish()
    }
    
    func personalDataVCNextStep() {
        showContactInfo()
    }
}

extension DataCoordinator: ContactInfoVCDelegate {
    func contactInfoVCVCDidFinish() {
        delegate?.dataCoordinatorDidFinish()
    }
    
    func contactInfoVCNextStep() {
        showCompanyData()
    }
}

extension DataCoordinator: CompanyDataVCDelegate {
    func companyDataVCDidFinish() {
        delegate?.dataCoordinatorDidFinish()
    }
    
    func companyDataVCNextStep() {
        
    }
}


