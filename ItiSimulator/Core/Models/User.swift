//
//  User.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 29/09/21.
//

import Foundation

class User {
    
    // MARK: - Attributes
    
    var firstName = String()
    var lastName = String()
    var documentNumber = String()
    var address = Address()
    var bankAccount = BankAccount()
    var password = String()
    
    // MARK: - Initializers (Constructors)
    
    init(firstName: String, lastName: String, documentNumber: String, password: String) {
        // Utilizado na criação da conta do usuário
        
        self.firstName = firstName
        self.lastName = lastName
        self.documentNumber = documentNumber
        self.password = password
    }
    
    init(firstName: String, lastName: String, documentNumber: String, address: Address, bankAccount: BankAccount, password: String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.documentNumber = documentNumber
        self.address = address
        self.bankAccount = bankAccount
        self.password = password
    }
    
}
