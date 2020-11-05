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
    
    func start(_ isRoot = true) {
        let isOnboardingAppeared = false
        
        if isOnboardingAppeared {
            showData()
        } else {
            showMain()
        }
    }
    
    private func showMain() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController, window: window)
        childCoordinators[.main] = mainCoordinator
        
        mainCoordinator.delegate = self
        
        mainCoordinator.start()
    }
    
    private func showData() {
        let dataCoordinator = DataCoordinator(navigationController: navigationController, window: window)
        childCoordinators[.data] = dataCoordinator
        dataCoordinator.delegate = self

        dataCoordinator.start()
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
