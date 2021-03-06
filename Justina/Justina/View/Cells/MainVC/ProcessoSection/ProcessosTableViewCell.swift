//
//  ProcessosTableViewCell.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 12/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class ProcessosTableViewCell: UITableViewCell {

    @IBOutlet weak var processoView: UIView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        progressView.progressTintColor = .buttonBackground
        progressView.trackTintColor = .systemGray
        progressView.addButtonCornerRadius()
        processoView.layer.cornerRadius = 11
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
