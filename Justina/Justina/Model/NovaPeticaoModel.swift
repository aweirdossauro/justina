//
//  NovaPeticaoModel.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 09/11/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import Foundation

class NovaPeticaoModel {
    ///Titulo das Celulas
    
    static let tableViewCellTitle : [String] = ["Dados do Requerente",
                                                "Dados do Processado",
                                                "Argumentação",
                                                "Provas - opcional",
                                                "Testemunhas - opcional",
                                                "Pedidos"]
    ///Subtitulo das Celulas
    static let tableViewCellBody : [String] = ["",
                                               "",
                                               "",
                                               "",
                                               "",
                                               ""]
    
    enum tableViewDataSource: Int {
        case dadosRequerente = 0,
             dadosProcessado,
             argumentacao,
             provas,
             testemunhas,
             pedidos
    }
}
