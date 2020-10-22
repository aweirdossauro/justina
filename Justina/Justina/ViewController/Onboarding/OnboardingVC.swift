//
//  OnboardingVC.swift
//  FlappyAR
//
//  Created by Vinicius Augusto Dilay de Paula on 13/08/20.
//  Copyright © 2020 YUR. All rights reserved.
//

import UIKit

class OnboardingVC: UIViewController, OnboardingPageVCDelegate, Storyboarded {
    // MARK:  Outlets
    
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 15
            nextButton.layer.masksToBounds = true
        }
    }
    
    // MARK: - Properties
    static var storyboardName: String = "Onboarding"
    var delegate: OnboardingVCDelegate?
    
    var onboardingPageVC: OnboardingPageVC?
    
    // MARK: - Actions
    
    @IBAction func nextButtonTapped(sender: UIButton) {
        if let index = onboardingPageVC?.currentIndex {
            switch index {
            case 0:
                onboardingPageVC?.forwardPage()
                
            case 1:
                //                UserDefaultsManager.save(value: true, forKey: .hasViewedOnboarding)
                coordinator?.dismiss(true)
                
            default: break
            }
        }
        
        updateUI()
    }
    
    func updateUI() {
        if let index = onboardingPageVC?.currentIndex {
            switch index {
            case 0:
                nextButton.setTitle("Próximo", for: .normal)
                
            case 1:
                nextButton.setTitle("Próximo", for: .normal)
                
            default: break
            }
            
            pageControl.currentPage = index
        }
    }
    
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
    
    // MARK: - View controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? OnboardingPageVC {
            onboardingPageVC = pageViewController
            onboardingPageVC?.onboardingDelegate = self
        }
    }
    
    
}

//MARK:- Coordinator Related Code
protocol OnboardingVCDelegate : AnyObject{
    func onboardingVCDidFinish()
    
}
