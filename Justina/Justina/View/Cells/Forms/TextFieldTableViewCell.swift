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
    
    @IBOutlet weak var confirmationView: UIView!
    enum ConfirmationState {
        case waiting,
             right,
             wrong
    }
    
    override func awakeFromNib() {
        let textButton = UIButton()
        textButton.translatesAutoresizingMaskIntoConstraints = false
        textButton.addTarget(self, action: #selector(startKeyboard), for: .touchUpInside)
        textButton.frame = contentView.frame
        textButton.layer.masksToBounds = true
        contentView.addSubview(textButton)
        
        NSLayoutConstraint.activate([
            textButton.centerYAnchor.constraint(equalTo:contentView.centerYAnchor),
            textButton.centerXAnchor.constraint(equalTo:contentView.centerXAnchor),
            textButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            textButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            textButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            textButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        confirmationView.backgroundColor = .systemGray3
        super.awakeFromNib()
    }

    func updateConfirmationView(state: ConfirmationState) {
        DispatchQueue.main.async {
            switch state {
            case .waiting:
                self.confirmationView.backgroundColor = .systemGray3
            case .right:
                self.confirmationView.backgroundColor = .green
            case .wrong:
                self.confirmationView.backgroundColor = .red
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.contentView.backgroundColor = .primaryBackground
    }
 
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
    }
    
    @objc func startKeyboard() {
        textField.becomeFirstResponder()
    }
}

