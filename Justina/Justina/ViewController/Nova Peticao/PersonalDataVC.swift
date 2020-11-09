//
//  PersonalDataVC.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 10/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit


class PersonalDataVC: UIViewController, Storyboarded {
  
    // MARK: Coordinator Related Properties
    static var storyboardName: String = "PersonalData"
    var delegate: PersonalDataVCDelegate?

    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.backgroundColor = .buttonBackground
        nextButton.addButtonCornerRadius()
    }
    

}

protocol PersonalDataVCDelegate: AnyObject {
    func personalDataVCDidFinish()
    
    func personalDataVCNextStep()

}
