//
//  ReuniaoProvasModel.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 23/11/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import Foundation
import PDFKit

class Peticoes {
    var peticoes : [Peticao]
    
    init() {
        peticoes = AppUserDefaults.value(forKey: .peticoes, fallBackValue: []) as! [Peticao]
    }
    
    func novaPetição() {
        
    }
}

class Peticao {
    var dadosDoUsuario : DadosDoUsuario
    var dadosDoProcessado : DadosDoProcessado
//    var dadosTestemunha: DadosTestemunha
//    var provas: Provas
//    var pedidos: Pedidos
    
    init(dadosDoUsuario: DadosDoUsuario,
         dadosDoProcessado: DadosDoProcessado) {
        self.dadosDoUsuario = dadosDoUsuario
        self.dadosDoProcessado = dadosDoProcessado
    }
}


struct DadosDoUsuario {
    var nome: String
    var nacionalidade: String
    var estadoCivil: String
    var dataDeNascimento: Date
    var rg: String
    var cpf: String
}

struct DadosDeContato {
    var cep: String
    var logradouro: String
    var numero: String
    var cidadeEstado: Date
    var telefone: String
    var email: String
}

struct DadosDoProcessado {
    var nomeDaEmpresa: String
    var cnpj: String
    var cep: String
    var logradouro: String
    var numero: String
    var cidadeEstado: String
    var telefone: String
    var emailDaEmpresa: String
}

class DadosTestemunha {}

class Provas {}

class Pedidos {}


