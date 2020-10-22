//
//  OnboardingContentVC.swift
//  FlappyAR
//
//  Created by Vinicius Augusto Dilay de Paula on 13/08/20.
//  Copyright © 2020 YUR. All rights reserved.
//

import UIKit

class OnboardingContentVC: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet var headingLabel: UILabel! {
        didSet {
            headingLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var contentImageView: UIImageView!
    
    // MARK: - Properties
    
    var index = 0
    var heading = ""
    var imageFile = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        configAnimation()
        headingLabel.text = heading
    }
    
    
    func configAnimation(){
        let animationIndex = index + 1
        let animationImages = (1...2).compactMap({ UIImage(named: "onboarding\(animationIndex)-\($0)") })

         contentImageView.animationImages = animationImages
         contentImageView.animationDuration = 1
         contentImageView.startAnimating()
    }
}
