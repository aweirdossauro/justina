//
//  ProcessosInfoCollectionViewCell.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 24/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class ProcessosInfoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.backgroundColor = .primaryBackground
        self.mainView.backgroundColor = .secondaryBackground

        self.mainView.layer.cornerRadius = 11
    }
    
}
