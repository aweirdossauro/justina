//
//  PeticaoProcessosModel.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 16/10/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import Foundation

class PeticaoProcessosModel {
    let tableView
    enum tableViewDataSource: Int {
        case dadosPessoas = 0,
             dadosDaEmpresa,
             textoDaPeticao,
             reuniaoDeProvas
    }
}
