//
//  Database.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

class Database {
    
    // MARK: - Attributes
    
    var users: [User] = []
    var credentials: [UserAccess] = []
    static var shared = Database()
    
    // MARK: - Initializers (Constructors)
    
    private init() {}
    
    // MARK: - Methods
    
    /* Save */
    
    func save(_ user: User) {
        Database.shared.users.append(user)
    }
    
    func save(_ access: UserAccess) {
        Database.shared.credentials.append(access)
    }
    
    /* Find */
    
    func findUserByDocumentNumber(_ documentNumber: String) -> User? {

        for index in Database.shared.users.indices {
            if Database.shared.users[index].documentNumber == documentNumber {
                return Database.shared.users[index]
            }
        }
        print("CPF não cadastrado!\n")
        return nil
    }
    
    func findUserByToken(_ token: String) -> User? {
        
        for index in Database.shared.credentials.indices {
            if Database.shared.credentials[index].token == token {
                return Database.shared.credentials[index].user
            }
        }
        print("Usuário não encontrado.\n")
        return nil
    }
    
    /* Delete */
    
    func delete(_ token: String) {
        
        guard let user = Database.shared.findUserByToken(token) else { return }
        
        for index in Database.shared.users.indices {
            if Database.shared.users[index].documentNumber == user.documentNumber {
                Database.shared.users.remove(at: index)
            }
        }
    }
    
}
