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
    static var shared = Database()
    
    // MARK: - Initializers (Constructors)
    
    private init() {}
    
    // MARK: - Methods
    
    /* Save */
    
    func saveUser(_ userWrapped: User?) -> Bool? {
        guard let user = userWrapped else { return nil}
        
        db.users.append(user)
        
        for index in db.users.indices {
            if db.users[index].documentNumber == user.documentNumber {
                return true
            }
        }
        return false
    }
    
    func saveAccess(_ credentialWrapped: Access?) -> Bool? {
        guard let credential = credentialWrapped else { return nil}
        
        db.credentials.append(credential)
        
        for index in db.credentials.indices {
            if db.credentials[index].token == credential.token {
                return true
            }
        }
        return false
    }
    
    /* Find */
    
    func findUserByDocumentNumber(_ documentNumberWrapped: String?) -> User? {
        guard let documentNumber = documentNumberWrapped else { return nil}

        for index in db.users.indices {
            if db.users[index].documentNumber == documentNumber {
                return db.users[index]
            }
        }
        print("CPF não cadastrado!")
        return nil
    }
    
    func findUserByToken(_ tokenWrapped: String?) -> User? {
        guard let token = tokenWrapped else { return nil}
        
        for index in db.credentials.indices {
            if db.credentials[index].token == token {
                return db.credentials[index].user
            }
        }
        print("Usuário não encontrado")
        return nil
    }
    
    /* Delete */
    
    func deleteUser(_ tokenWrapped: String?) -> Bool? {
        guard let token = tokenWrapped else { return nil}
        
        guard let user = db.findUserByToken(token) else { return nil }
        
        for index in db.users.indices {
            if db.users[index].documentNumber == user.documentNumber {
                db.users.remove(at: index)
                return true
            }
        }
        return false
    }
    
    /* Update */
    
    func updateUser(key tokenWrapped: String?, where attributeWrapped: String?, of valueWrapped: String?) -> Bool? {
        guard let token = tokenWrapped else { return nil}
        guard let attribute = attributeWrapped else { return nil}
        guard let value = valueWrapped else { return nil}
        
        guard let user = db.findUserByToken(token) else { return nil }
        
        for index in db.users.indices {
            if db.users[index].documentNumber == user.documentNumber{
                
                let userFound = db.users[index]
                
                if attribute == "firstName" {
                    userFound.firstName = value
                }
                else if attribute == "lastName" {
                    userFound.lastName = value
                }
                else if attribute == "address" {
                    userFound.address = value
                }
                else if attribute == "city" {
                    userFound.city = value
                }
                else if attribute == "state" {
                    userFound.state = value
                }
                else if attribute == "balance" {
                    guard let valueDouble = Double(value) else { return nil }
                    
                    userFound.bankAccount.balance = valueDouble
                }
                return true
            }
        }
        return false
    }
    
}
