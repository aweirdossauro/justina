//
//  AppCoordinator.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 10/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit


enum AppChildCoordinator {
    case data
    case main
    case login
}

class AppCoordinator: NavigationCoordinator {
    
    var navigationController: UINavigationController
    
    private var childCoordinators = [AppChildCoordinator: Coordinator]()


    weak var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window

        navigationController = UINavigationController()
        setDefaultProperties()

//        activeCoordinator = mainCoordinator
        
        self.window?.rootViewController = navigationController
    }
    
    func start(_ isRoot : Bool = true) {
        let isOnboardingAppeared = false
        
        if isOnboardingAppeared {
            showMain()
        } else {
            showNewUserFlow()
        }
    }
    
    internal func showMain(_ isRoot : Bool = true) {
        let mainCoordinator = MainCoordinator(navigationController: navigationController, window: window)
        childCoordinators[.main] = mainCoordinator
        
        mainCoordinator.delegate = self
        
        mainCoordinator.start(true)
    }
    
    internal func showData(_ isRoot : Bool = true) {
        let dataCoordinator = DataCoordinator(navigationController: navigationController, window: window)
        childCoordinators[.data] = dataCoordinator
        dataCoordinator.delegate = self

        dataCoordinator.start(isRoot)
    }
    
    internal func showNewUserFlow() {
        let vc = OnboardingEndVC.instantiate()
        vc.delegate = self
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        
        // apresentar tela de opção e dps já o onboarding
    }

}


// MARK: - Delegate

extension AppCoordinator: MainCoordinatorDelegate {
    func mainCoordinatorDidFinish() {
        childCoordinators[.main] = nil
        showData()
    }

}

extension AppCoordinator: DataCoordinatorDelegate {
    func dataCoordinatorDidFinish() {
        childCoordinators[.data] = nil
        showMain()
    }
}

extension AppCoordinator: OnboardingEndVCDelegate {
    func showDataFromOnboarding() {
        showData(false)
    }
    
    func showMainFromOnboarding() {
        showMain(true)
    }
}
