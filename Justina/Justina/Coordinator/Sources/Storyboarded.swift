//
//  Storyboarded.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 01/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//  This is from Enzel boy

import UIKit

protocol Storyboarded {
    static var storyboardName: String { get }
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {

    static func instantiate() -> Self {
        // This pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)

        // This splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]

        // Load our storyboard
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        
        guard let selfVC = storyboard.instantiateViewController(withIdentifier: className) as? Self else {
            fatalError()
        }

        // Instantiate a view controller with that identifier, and force cast as the type that was requested
        return selfVC
    }
}
