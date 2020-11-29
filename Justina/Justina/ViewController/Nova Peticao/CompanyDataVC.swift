//
//  CompanyDataVC.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 24/10/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class CompanyDataVC: UIViewController , Storyboarded {

    // MARK: Coordinator Related Properties
    static var storyboardName: String = "PersonalData"
    var delegate: CompanyDataVCDelegate?

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

extension CompanyDataVC: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            ///textfields do form + botão de continue
            CompanyDataModel.tableViewCellTitle.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let row = CompanyDataModel.tableViewDataSource.init(rawValue: indexPath.row)
            if row == .proximo {
                let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.continueTableViewCell) as! ContinueTableViewCell
                return cell
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.textFieldTableViewCell) as! TextFieldTableViewCell
            cell.nameLabel.text = CompanyDataModel.tableViewCellTitle[indexPath.row]
            cell.textField.tag = indexPath.row
            cell.textField.placeholder = CompanyDataModel.tableViewCellPlaceholderText[indexPath.row]
            cell.textField.delegate = self
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            let row = CompanyDataModel.tableViewDataSource.init(rawValue: indexPath.row)
            
            return row == .proximo ? 60 : 100

        }
}

extension CompanyDataVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let tag = CompanyDataModel.tableViewDataSource.init(rawValue: textField.tag)
        if let cell = tableView.cellForRow(at: IndexPath(row: tag!.rawValue, section: 0)) as? TextFieldTableViewCell {
            if cell.textField.text?.isEmpty == true {
                cell.updateConfirmationView(state: .wrong)
                return
            }
            cell.updateConfirmationView(state: .right)
            
            let peticaoTemporaria = PeticaoTemporaria.shared
            switch tag {
            case .nomeDaEmpresa:
                peticaoTemporaria.nomeDaEmpresa = textField.text
            case .cnpj:
                peticaoTemporaria.cnpj = textField.text
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
            case .emailDaEmpresa:
                peticaoTemporaria.emailDaEmpresa = textField.text
            case .proximo: break
            case .none: break
            }
        }
    }
}
protocol CompanyDataVCDelegate: AnyObject {
    func companyDataVCDidFinish()
    
    func companyDataVCNextStep()
}

