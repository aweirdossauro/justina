//
//  ProcessosInfoVC.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 16/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class ProcessosInfoVC: UIViewController, Storyboarded {
    // MARK: Coordinator Related Properties
    static var storyboardName: String = "Main"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Painel de Petição"
        navigationController?.navigationBar.backItem?.title = "aa"
    }
    
}