//
//  FormsModel.swift
//  Justina
//
//  Created by Vinicius Augusto Dilay de Paula on 12/11/20.
//  Copyright © 2020 aweirdossauro. All rights reserved.
//

import Foundation

class PersonalDataModel {
    ///Titulo das Celulas
    static let tableViewCellTitle : [String] = ["Nome Completo",
//                                                "Nacionalidade",
                                                "Estado civil",
//                                                "Data de nascimento",
                                                "RG",
                                                "CPF",
                                                "Continue"]
    
    static let tableViewCellPlaceholderText : [String] = ["Digite seu nome",
//                                                          "Selecione a nacionalidade",
                                                          "Selecione seu estado civil",
//                                                          "Selecione Data de nascimento",
                                                          "Digite aqui seu numero de RG",
                                                          "Digite aqui seu CPF",
                                                          ""]

    enum tableViewDataSource: Int {
        case nome = 0,
//             nacionalidade,
             estadoCivil,
             dataDeNascimento,
             rg,
             cpf,
             proximo
    }
}

class ContactInfoModel {
    ///Titulo das Celulas
    static let tableViewCellTitle : [String] = ["CEP",
                                                "Logradouro",
                                                "Número",
                                                "Cidade e Estado",
                                                "Telefone",
                                                "Email",
                                                "Próximo"]
    
    static let tableViewCellPlaceholderText : [String] = ["Digite o CEP",
                                                          "Digite o logradouro",
                                                          "Digite o número",
                                                          "Digite a Cidade e Estado",
                                                          "Digite seu número de telefone",
                                                          "Digite seu endereço de e-mail",
                                                          "Próximo"]

    enum tableViewDataSource: Int {
        case cep = 0,
             logradouro,
             numero,
             cidadeEstado,
             telefone,
             email,
             proximo
    }
}

class CompanyDataModel {
    ///Titulo das Celulas
    static let tableViewCellTitle : [String] = ["Nome da Empresa",
                                                "CNPJ da Empresa",
                                                "CEP",
                                                "Logradouro",
                                                "Número",
                                                "Cidade e Estado",
                                                "Telefone da Empresa",
                                                "E-mail da Empresa",
                                                "Próximo"]
    
    static let tableViewCellPlaceholderText : [String] = ["Digite o nome da empresa",
                                                          "Digite o CNPJ da empresa",
                                                          "Digite o CEP",
                                                          "Digite o logradouro",
                                                          "Digite o número",
                                                          "Digite a Cidade e Estado",
                                                          "Digite o número de telefone ou celular da empresa",
                                                          "Digite o endereço de e-mail da empresa",
                                                          "Próximo"]
    
    enum tableViewDataSource: Int {
        case nomeDaEmpresa = 0,
             cnpj,
             cep,
             logradouro,
             numero,
             cidadeEstado,
             telefone,
             emailDaEmpresa,
             proximo
    }
}
