//
//  Database.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 29/09/21.
//

import Foundation

class Database {
    
    var id = 0
    var ids = [1, 2]
    
    var data = [
        UserModel(
            id: 1,
            firstName: "Giovanni",
            lastName: "Moratto",
            document: "75157764049",
            address: "Rua da Amizade, 123",
            city: "Americana",
            state: "SP",
            phoneNumber: "999999999",
            creditCard: "5354648424734967",
            creditCards: ["5354648424734967"],
            bankAccount: "970129",
            bank: "Itaú",
            balance: 5000.00,
            pixKey: "giovanni.moratto@zup.com.br",
            login: "giovanni.moratto@zup.com.br",
            password: "zup123"
        ),
        UserModel(
            id: 2,
            firstName: "Fulano",
            lastName: "de Tal",
            document: "65157764049",
            address: "Alameda dos Anjos, 1234",
            city: "Americana",
            state: "SP",
            phoneNumber: "779998888",
            creditCard: "5418956937769477",
            creditCards: ["5418956937769477"],
            bankAccount: "323340",
            bank: "Itaú",
            balance: 2000.00,
            pixKey: "id02@zup.com.br",
            login: "id02@zup.com.br",
            password: "zup123"
        ),
        UserModel(
            id: 3,
            firstName: "Lucas",
            lastName: "Silva e Silva",
            document: "75157764049",
            address: "Mundo da Lua, 123",
            city: "Americana",
            state: "SP",
            phoneNumber: "214567777",
            creditCard: "5310446144465035",
            creditCards: ["5310446144465035"],
            bankAccount: "844533",
            bank: "Itaú",
            balance: 1000.00,
            pixKey: "id03@zup.com.br",
            login: "id03@zup.com.br",
            password: "zup123"
        )
    ]

    func idGenerate() -> Int {
        id = ids.endIndex + 1
        ids.append(id)
        return id
    }
    
}
