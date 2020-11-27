//
//  ContactInfoVC.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 24/10/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class ContactInfoVC: UIViewController, Storyboarded {
    
    // MARK: Coordinator Related Properties
    static var storyboardName: String = "PersonalData"
    var delegate: ContactInfoVCDelegate?
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: CellIdentifiers.textFieldTableViewCell, bundle: nil),
                               forCellReuseIdentifier: CellIdentifiers.textFieldTableViewCell)
            tableView.register(UINib(nibName: CellIdentifiers.continueTableViewCell, bundle: nil),
                               forCellReuseIdentifier: CellIdentifiers.continueTableViewCell)

        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension ContactInfoVC: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            ///textfields do form + botão de continue
            ContactInfoModel.tableViewCellTitle.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let row = ContactInfoModel.tableViewDataSource.init(rawValue: indexPath.row)
            if row == .proximo {
                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.continueTableViewCell) as! ContinueTableViewCell
                return cell
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.textFieldTableViewCell) as! TextFieldTableViewCell
            cell.nameLabel.text = PersonalDataModel.tableViewCellTitle[indexPath.row]
            cell.textField.tag = indexPath.row
            cell.textField.placeholder = PersonalDataModel.tableViewCellPlaceholderText[indexPath.row]
            cell.textField.delegate = self
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            let row = PersonalDataModel.tableViewDataSource.init(rawValue: indexPath.row)
            
            return row == .proximo ? 60 : 100

        }
}

extension ContactInfoVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let tag = ContactInfoModel.tableViewDataSource.init(rawValue: textField.tag)
        if let cell = tableView.cellForRow(at: IndexPath(row: tag!.rawValue, section: 0)) as? TextFieldTableViewCell {
            if cell.textField.text?.isEmpty == true {
                cell.updateConfirmationView(state: .wrong)
                return
            }
            cell.updateConfirmationView(state: .right)
            
            let peticaoTemporaria = PeticaoTemporaria.shared
            switch tag {
            case .cep:
                peticaoTemporaria.cep = textField.text
            case .logradouro:
                peticaoTemporaria.logradouro = textField.text
            case .numero:
                peticaoTemporaria.numero = textField.text
            case .cidadeEstado:
                peticaoTemporaria.cidadeEstado = textField.text
            case .telefone:
                peticaoTemporaria.telefone = textField.text
            case .email:
                peticaoTemporaria.email = textField.text
            case .proximo: break
            case .none: break
            }
            
        }
    }
}

protocol ContactInfoVCDelegate: AnyObject {
    func contactInfoVCVCDidFinish()
    
    func contactInfoVCNextStep()
}
