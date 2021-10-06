//
//  Database.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 29/09/21.
//

import Foundation

class Database {
    
    // MARK: - Attributes
    
    var users: [UserModel] = []

    static var shared: Database = {
        var instance = Database()
        return instance
    }()
    
    private init() {}
    
    // MARK: - Methods
    
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
        
        Database.shared.users = users
    }
    
    func save(user: UserModel?) -> Bool? {
        guard let userUnwrapped = user else { return nil}
        
        Database.shared.users.append(userUnwrapped)
        
        for user in Database.shared.users.indices {
            if Database.shared.users[user].documentNumber == userUnwrapped.documentNumber {
                return true
            }
        }
        return false
    }
    
    func delete(user: UserModel?) -> Bool? {
        guard let userUnwrapped = user else { return nil}
        
        for user in Database.shared.users.indices {
            if Database.shared.users[user].documentNumber == userUnwrapped.documentNumber {
                Database.shared.users.remove(at: user)
                return true
            }
        }
        return false
    }
    
    func findByDocumentNumber(documentNumber: String?) -> UserModel? {
        guard let documentNumberUnwrapped = documentNumber else { return nil}
        
        for user in Database.shared.users.indices {
            if Database.shared.users[user].documentNumber == documentNumberUnwrapped {
                return Database.shared.users[user]
            }
        }
        print("CPF não cadastrado!")
        return nil
    }
    
    func update(user: UserModel?, attribute: String?, value: String?) -> Bool? {
        guard let userUnwrapped = user else { return nil}
        guard let attributeUnwrapped = attribute else { return nil}
        guard let valueUnwrapped = value else { return nil}
        
        for user in Database.shared.users.indices {
            if Database.shared.users[user].documentNumber == userUnwrapped.documentNumber{
                
                let userFound = Database.shared.users[user]
                
                if attributeUnwrapped == "firstName" {
                    userFound.firstName = valueUnwrapped
                }
                else if attributeUnwrapped == "lastName" {
                    userFound.lastName = valueUnwrapped
                }
                else if attributeUnwrapped == "address" {
                    userFound.address = valueUnwrapped
                }
                else if attributeUnwrapped == "city" {
                    userFound.city = valueUnwrapped
                }
                else if attributeUnwrapped == "state" {
                    userFound.state = valueUnwrapped
                }
                else if attributeUnwrapped == "phoneNumber" {
                    userFound.phoneNumber = valueUnwrapped
                }
                else if attributeUnwrapped == "email" {
                    userFound.email = valueUnwrapped
                }
                return true
            }
        }
        return false
    }
    
}
