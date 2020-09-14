//
//  AddProcessoTableViewCell.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 14/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class AddProcessoTableViewCell: UITableViewCell {

    @IBOutlet weak var addProcessoView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addProcessoView.layer.cornerRadius = 11
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
