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
        
        mainCoordinator.start(isRoot)
    }
    
    internal func showData(_ isRoot : Bool = true, navController : UINavigationController?) {
        var navigation = navigationController
        if let navController = navController {
            navigation = navController
        }
        let dataCoordinator = DataCoordinator(navigationController: navigation, window: window, isRoot)
        childCoordinators[.data] = dataCoordinator
        dataCoordinator.delegate = self

        dataCoordinator.start(isRoot)
    }
    
    internal func showNewUserFlow() {
        let vc = OnboardingEndVC.instantiate()
        vc.delegate = self
        
        self.window?.rootViewController = self.navigationController
        self.window?.makeKeyAndVisible()
        
        self.navigationController.pushViewController(vc, animated: true)
    }

}


// MARK: - Delegate

extension AppCoordinator: MainCoordinatorDelegate {
    func mainCoordinatorDidFinish(currentNavController : UINavigationController?) {
        childCoordinators[.main] = nil
        showData(false, navController: currentNavController)
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
        showData(false, navController: nil)
    }
    
    func showMainFromOnboarding() {
        showMain(true)
    }
}
