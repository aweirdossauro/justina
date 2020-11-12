//
//  TextFieldTableViewCell.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 12/11/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.contentView.backgroundColor = .primaryBackground
        // Configure the view for the selected state
    }
 
    // Inside UITableViewCell subclass

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
    }
}

