//
//  ProcessosInfoTableViewCell.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 08/10/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class ProcessosInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainView.layer.cornerRadius = 10
//        self.mainView.installShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
        
    }
    
}
