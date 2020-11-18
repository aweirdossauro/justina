//
//  PersonalDataVC.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 10/09/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit


class PersonalDataVC: UIViewController, Storyboarded {
  
    // MARK: Coordinator Related Properties
    static var storyboardName: String = "PersonalData"
    var delegate: PersonalDataVCDelegate?

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

extension PersonalDataVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ///textfields do form + botão de continue
        PersonalDataModel.tableViewCellTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row ==  PersonalDataModel.tableViewCellTitle.count - 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.continueTableViewCell) as! ContinueTableViewCell
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.textFieldTableViewCell) as! TextFieldTableViewCell
        cell.nameLabel.text = PersonalDataModel.tableViewCellTitle[indexPath.row]
        cell.textField.tag = indexPath.row
        cell.textField.placeholder = PersonalDataModel.tableViewCellPlaceholderText[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == indexPath.count - 1 ? 60 : 100

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = PersonalDataModel.tableViewDataSource.init(rawValue: indexPath.row)
        switch row {
        case .nome: break
        case .nacionalidade: break
        case .estadoCivil: break
        case .dataDeNascimento: break
        case .rg: break
        case .cpf: break
        default: break
        }
    }
    
}

extension PersonalDataVC : UITextFieldDelegate {

}

protocol PersonalDataVCDelegate: AnyObject {
    func personalDataVCDidFinish()
    
    func personalDataVCNextStep()

}
