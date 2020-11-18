//
//  ContinueTableViewCell.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 18/11/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class ContinueTableViewCell: UITableViewCell {

    @IBOutlet weak var continueButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        continueButton.tintColor = .white
        continueButton.backgroundColor = .buttonBackground
        continueButton.layer.cornerRadius = continueButton.frame.height/2
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
