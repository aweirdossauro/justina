//
//  NovaPeticaoVC.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 09/11/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class NovaPeticaoVC: UIViewController, Storyboarded {
    // MARK: Coordinator Related Properties
    static var storyboardName: String = "PersonalData"
    var delegate: NovaPeticaoVCDelegate?
    
    /// TableView Principal
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: CellIdentifiers.novaPeticaoTableViewCell, bundle: nil),
                               forCellReuseIdentifier: CellIdentifiers.novaPeticaoTableViewCell)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension NovaPeticaoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NovaPeticaoModel.tableViewCellTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.novaPeticaoTableViewCell) as! NovaPeticaoTableViewCell
        cell.mainLabel.text = NovaPeticaoModel.tableViewCellTitle[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = NovaPeticaoModel.tableViewDataSource.init(rawValue: indexPath.row)
                switch row {
                case .dadosProcessado:
                    delegate?.showPersonalData()
//                    delegate?.showContactInfo()
                case .dadosRequerente:
                    delegate?.showCompanyData()
                    
                case .argumentacao: break
                case .provas: break
                case .testemunhas: break
                case .pedidos: break
                    
                default:
                    break
                }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

protocol NovaPeticaoVCDelegate: AnyObject {
    func novaPeticaoVCDidFinish()
    
    func showPersonalData()
    
    func showContactInfo()
    
    func showCompanyData()
}
