//
//  NovaPeticaoTableViewCell.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 09/11/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class NovaPeticaoTableViewCell: UITableViewCell {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var iconeImagem: UIImageView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var mainBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear

            self.backView.layer.borderWidth = 1
            self.backView.layer.cornerRadius = 10
            self.backView.layer.borderColor = UIColor.clear.cgColor
            self.backView.layer.masksToBounds = true

            self.layer.shadowOpacity = 0.18
            self.layer.shadowOffset = CGSize(width: 0, height: 2)
            self.layer.shadowRadius = 2
            self.layer.shadowColor = UIColor.blue.cgColor
            self.layer.masksToBounds = false

        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))


    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
    
}
