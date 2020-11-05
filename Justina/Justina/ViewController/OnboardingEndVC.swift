//
//  OnboardingEndVC.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 05/11/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class OnboardingEndVC: UIViewController, Storyboarded {
    
    // MARK: Coordinator Related Properties
    static var storyboardName: String = "Onboarding"
    var delegate: MainVCDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func peticaoAction(_ sender: Any) {
        
    }
    
    @IBAction func menuInicialAction(_ sender: Any) {
    }
}
