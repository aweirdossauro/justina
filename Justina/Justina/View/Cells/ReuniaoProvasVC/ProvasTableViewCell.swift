//
//  ProvasTableViewCell.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 20/11/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class ProvasTableViewCell: UITableViewCell {

    @IBOutlet weak var provasTopView: UIView!
    @IBOutlet weak var provasView: UIView!
    @IBOutlet weak var provasLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        provasView.roundCorners(corners: [.bottomLeft, .bottomRight, .topRight], radius: 12)
        provasTopView.roundCorners(corners: [.topLeft, .topRight], radius: 12)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
