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
    
    func save(user: UserModel?) -> Bool? {
        guard let userUnwrapped = user else { return nil}
        
        db.users.append(userUnwrapped)
        
        for user in db.users.indices {
            if db.users[user].documentNumber == userUnwrapped.documentNumber {
                return true
            }
        }
        return false
    }
    
    func delete(user: UserModel?) -> Bool? {
        guard let userUnwrapped = user else { return nil}
        
        for user in db.users.indices {
            if db.users[user].documentNumber == userUnwrapped.documentNumber {
                db.users.remove(at: user)
                return true
            }
        }
        return false
    }
    
    func find(documentNumber: String?) -> UserModel? {
        guard let documentNumberUnwrapped = documentNumber else { return nil}
        
        for user in db.users.indices {
            if db.users[user].documentNumber == documentNumberUnwrapped {
                return db.users[user]
            }
        }
        print("CPF não cadastrado!")
        return nil
    }
    
    func update(user: UserModel?, attribute: String?, value: String?) -> Bool? {
        guard let userUnwrapped = user else { return nil}
        guard let attributeUnwrapped = attribute else { return nil}
        guard let valueUnwrapped = value else { return nil}
        
        for user in db.users.indices {
            if db.users[user].documentNumber == userUnwrapped.documentNumber{
                
                let userFound = db.users[user]
                
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
