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
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.showOnboarding()
        }
    }
    
    func showOnboarding(){
        DispatchQueue.main.async {
            let vc = OnboardingVC.instantiate()
            vc.delegate = self
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }

    @IBAction func peticaoAction(_ sender: Any) {
        delegate?.showData()
    }
    
    @IBAction func menuInicialAction(_ sender: Any) {
        delegate?.showMain()
    }
}

//MARK:- Coordinator Related Code
extension OnboardingEndVC : OnboardingVCDelegate {
    func onboardingVCDidFinish() {
        self.dismiss(animated: true, completion: nil)
    }
}


protocol OnboardingEndVCDelegate : AnyObject{
    func showData()
    
    func showMain()
}

