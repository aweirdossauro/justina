//
//  Coordinator.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 01/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

protocol Coordinator {
    var rootViewController: UIViewController { get }
    
    /**
     Entry point starting the coordinator
     */
    func start()
}

