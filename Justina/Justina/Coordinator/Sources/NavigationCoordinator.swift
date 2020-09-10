//
//  NavigationCoordinator.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 01/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

protocol NavigationCoordinator: Coordinator {
    var navigationController: UINavigationController { get set }
    var rootViewController: UIViewController { get }

    func setDefaultProperties()
}

extension NavigationCoordinator {
    var rootViewController: UIViewController {
        navigationController
    }

    func setDefaultProperties() {
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
    }
}

