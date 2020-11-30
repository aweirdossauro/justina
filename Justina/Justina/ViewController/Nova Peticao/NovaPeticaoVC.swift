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
    
    var peticao : Peticao?
    
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
        
        title = "NOVA PETIÇÃO"
        
        peticao = Peticao(dadosDoUsuario: DadosDoUsuario(nome: "",
                                                         nacionalidade: "",
                                                         estadoCivil: "",
                                                         dataDeNascimento: Date(),
                                                         rg: "",
                                                         cpf: ""),
                          dadosDoProcessado: DadosDoProcessado(nomeDaEmpresa: "",
                                                               cnpj: "",
                                                               cep: "",
                                                               logradouro: "",
                                                               numero: "",
                                                               cidadeEstado: "",
                                                               telefone: "",
                                                               emailDaEmpresa: ""))
    }
    
    @IBAction func backAction(_ sender: Any) {
        delegate?.novaPeticaoVCDidFinish()
    }
    
}

extension NovaPeticaoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NovaPeticaoModel.tableViewCellTitle.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.novaPeticaoTableViewCell) as! NovaPeticaoTableViewCell
        
        cell.mainLabel.text = NovaPeticaoModel.tableViewCellTitle[indexPath.row]
        cell.iconeImagem.image = UIImage(named: NovaPeticaoModel.tableViewCellIcon[indexPath.row])
        
//        ///Corner radius
//        cell.backView.layer.cornerRadius = 8
//        cell.backView.layer.masksToBounds = true
//
//
//        ///Shadow
//        cell.backView.layer.shadowOffset = CGSize(width: 0, height: 0)
//        cell.backView.layer.shadowColor = UIColor.black.cgColor
//        cell.backView.layer.shadowRadius = 10
//        cell.backView.layer.shadowOpacity = 0.23
//        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // this will turn on `masksToBounds` just before showing the cell
        cell.contentView.layer.masksToBounds = true
        
        /// Animação
        cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            UIView.animate(withDuration: 0.4) {
                cell.transform = CGAffineTransform.identity

            }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = NovaPeticaoModel.tableViewDataSource.init(rawValue: indexPath.row)
        switch row {
        case .dadosRequerente:
            delegate?.showPersonalData()
        //                    delegate?.showContactInfo()
        case .infoDeContato:
            delegate?.showContactInfo()
        case .dadosProcessado:
            delegate?.showCompanyData()
            
        case .argumentacao:
            delegate?.showArgumentacao()
//        case .provas: break
//        case .testemunhas: break
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
    
    func showArgumentacao()
}


