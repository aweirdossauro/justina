//
//  OnboardingContentVC.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 22/10/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
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
        
        contentImageView.image = UIImage(named: imageFile)
        headingLabel.text = heading
    }
}
