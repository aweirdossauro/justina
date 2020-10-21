//
//  peticaoProcessosVC.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 09/10/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import UIKit

class PeticaoProcessosVC: UIViewController, Storyboarded {
    // MARK: Coordinator Related Properties
    static var storyboardName: String = "Main"
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: CellIdentifiers.processosInfoTableViewCell, bundle: nil),
                               forCellReuseIdentifier: CellIdentifiers.processosInfoTableViewCell)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    

}

extension PeticaoProcessosVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        PeticaoProcessosModel.tableViewCellTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = PeticaoProcessosModel.tableViewDataSource.init(rawValue: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.processosInfoTableViewCell) as! ProcessosInfoTableViewCell
        cell.mainLabel.text = PeticaoProcessosModel.tableViewCellTitle[indexPath.row]
//        switch row {
//        case .dadosPessoais:
//            cell.mainLabel =
//        case .dadosDaEmpresa:
//            break
//        case .textoDaPeticao:
//            break
//        case .reuniaoDeProvas:
//            break
//        default:
//            break
//        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
