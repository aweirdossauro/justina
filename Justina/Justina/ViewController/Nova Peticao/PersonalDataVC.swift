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
        PersonalDataModel.tableViewCellTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = PersonalDataModel.tableViewDataSource.init(rawValue: indexPath.row)
     
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.textFieldTableViewCell) as! TextFieldTableViewCell
        cell.nameLabel.text = PersonalDataModel.tableViewCellTitle[indexPath.row]
        cell.textField.placeholder = PersonalDataModel.tableViewCellPlaceholderText[indexPath.row]
//        switch row {
//        case .nome:
//
//        case .nacionalidade: break
//        case .estadoCivil: break
//        case .dataDeNascimento: break
//        case .rg: break
//        case .cpf: break
//        default: break
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

protocol PersonalDataVCDelegate: AnyObject {
    func personalDataVCDidFinish()
    
    func personalDataVCNextStep()

}
