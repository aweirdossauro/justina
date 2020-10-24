//
//  PeticaoProcessosModel.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 16/10/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import Foundation

class PeticaoProcessosModel {
    static let tableViewCellTitle : [String] = ["Dados Pessoais",
                                                "Informações de Contato",
                                         "Dados da Empresa",
                                         "Texto da Petição",
                                         "Reunião de Provas"]

    enum tableViewDataSource: Int {
        case dadosPessoais = 0,
             infoDeContato,
             dadosDaEmpresa,
             textoDaPeticao,
             reuniaoDeProvas
    }
}
