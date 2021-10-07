//
//  Data.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 07/10/21.
//

import Foundation

class Data {
    
    func initialData() {
        
        let users = [
            UserModel(
                firstName: "Giovanni",
                lastName: "Moratto",
                documentNumber: "051.918.080-10",
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
                email: "giovanni.moratto@zup.com.br",
                password: "Zup123456!"
            ),
            UserModel(
                firstName: "Fulano",
                lastName: "de Tal",
                documentNumber: "234.083.290-01",
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
                email: "id02@zup.com.br",
                password: "Zup123456!"
            ),
            UserModel(
                firstName: "Lucas",
                lastName: "Silva e Silva",
                documentNumber: "152.936.600-39",
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
                email: "id03@zup.com.br",
                password: "Zup123456!"
            )
        ]
        db.users = users
    }
    
}
