//
//  ArgumentacaoVC.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 19/11/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class ArgumentacaoVC: UIViewController, Storyboarded {
    
    // MARK: Coordinator Related Properties
    static var storyboardName: String = "PersonalData"
    var delegate: ArgumentacaoVCDelegate?

    @IBOutlet weak var argumentaçãoTextView: UITextView!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        continueButton.layer.cornerRadius = continueButton.frame.height/2
        argumentaçãoTextView.layer.cornerRadius = 11
        argumentaçãoTextView.delegate = self
    }
    
    @IBAction func continueButton(_ sender: Any) {
        
    }
}
protocol ArgumentacaoVCDelegate: AnyObject {
    func argumentacaoVCDidFinish()
    
    func argumentacaoVCNextStep()
}

extension ArgumentacaoVC : UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        PeticaoTemporaria.shared.argumentacao = textView.text
    }
}
