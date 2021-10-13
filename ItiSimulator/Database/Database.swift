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
        guard let index = Database.shared.users.firstIndex(where: { $0.documentNumber == documentNumber }) else { return nil }
        return Database.shared.users[index]
    }
    
    func findUserByToken(_ token: String) -> User? {
        guard let index = Database.shared.credentials.firstIndex(where: { $0.token == token }) else { return nil }
        return Database.shared.credentials[index].user
    }
    
    func findPayee(_ bank: String, _ branch: Int, _ account: Int) -> (condition: Bool, user: User?){
        guard let index = Database.shared.users.firstIndex(where: {
            $0.bankAccount.bank == bank && $0.bankAccount.branch == branch && $0.bankAccount.account == account
        }) else { return (false, nil) }
        return (true, Database.shared.users[index])
    }
    
    /* Delete */
    
    func delete(_ token: String) {
        guard let user = Database.shared.findUserByToken(token) else { return }
        guard let index = Database.shared.users.firstIndex(where: { $0.documentNumber == user.documentNumber }) else { return }
        Database.shared.users.remove(at: index)
    }
    
}
