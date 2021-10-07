//
//  Database.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 29/09/21.
//

import Foundation

class Database {
    
    // MARK: - Attributes
    
    var users: [User] = []
    var credentials: [Access] = []
    
    static var shared: Database = {
        var instance = Database()
        return instance
    }()
    
    private init() {}
    
    // MARK: - Methods
    
    func save(user: User?) -> Bool? {
        guard let userUnwrapped = user else { return nil}
        
        db.users.append(userUnwrapped)
        
        for user in db.users.indices {
            if db.users[user].documentNumber == userUnwrapped.documentNumber {
                return true
            }
        }
        return false
    }
    
    func delete(token: String?) -> Bool? {
        guard let tokenUnwrapped = token else { return nil}
        
        guard let user = db.find(token: tokenUnwrapped) else { return nil }
        
        for index in db.users.indices {
            if db.users[index].documentNumber == user.documentNumber {
                db.users.remove(at: index)
                return true
            }
        }
        return false
    }
    
    func find(documentNumber: String?) -> User? {
        guard let documentNumberUnwrapped = documentNumber else { return nil}

        for user in db.users.indices {
            if db.users[user].documentNumber == documentNumberUnwrapped {
                return db.users[user]
            }
        }
        print("CPF não cadastrado!")
        return nil
    }
    
    func update(token: String?, attribute: String?, value: String?) -> Bool? {
        guard let tokenUnwrapped = token else { return nil}
        guard let attributeUnwrapped = attribute else { return nil}
        guard let valueUnwrapped = value else { return nil}
        
        guard let user = db.find(token: tokenUnwrapped) else { return nil }
        
        for index in db.users.indices {
            if db.users[index].documentNumber == user.documentNumber{
                
                let userFound = db.users[index]
                
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
                else if attributeUnwrapped == "balance" {
                    guard let valueDouble = Double(valueUnwrapped) else { return nil }
                    
                    userFound.bankAccount.balance = valueDouble
                }
                return true
            }
        }
        return false
    }
    
    func save(credential: Access?) -> Bool? {
        guard let credentialUnwrapped = credential else { return nil}
        
        db.credentials.append(credentialUnwrapped)
        
        for access in db.credentials.indices {
            if db.credentials[access].token == credentialUnwrapped.token {
                return true
            }
        }
        return false
    }
    
    func find(token: String?) -> User? {
        guard let tokenUnwrapped = token else { return nil}
        
        for access in db.credentials.indices {
            if db.credentials[access].token == tokenUnwrapped {
                return db.credentials[access].user
            }
        }
        print("Usuário não encontrado")
        return nil
    }
    
}
