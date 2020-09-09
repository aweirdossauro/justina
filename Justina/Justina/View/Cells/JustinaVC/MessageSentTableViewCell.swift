//
//  MessageSentTableViewCell.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 09/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class MessageSentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    var messageText : String = "vazio"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageLabel.text = messageText
        messageView.layer.cornerRadius = 11
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
