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
    weak var delegate: OnboardingEndVCDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func peticaoAction(_ sender: Any) {
        delegate?.showData()
    }
    
    @IBAction func menuInicialAction(_ sender: Any) {
        delegate?.showMain()
    }
}

//MARK:- Coordinator Related Code
protocol OnboardingEndVCDelegate : AnyObject{
    func showData()
    
    func showMain()
}

