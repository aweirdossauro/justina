//
//  JustinaMessageTableViewCell.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 12/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class JustinaMessageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    var messageText : String = "vazio"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageLabel.text = messageText
        messageView.layer.cornerRadius = 11
        
        self.contentView.backgroundColor = .primaryBackground
        
        self.messageView.backgroundColor = .secondaryBackground
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
