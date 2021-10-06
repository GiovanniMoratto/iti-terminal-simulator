//
//  UserModel.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 29/09/21.
//

import Foundation

class UserModel {
    
    // MARK: - Attributes
    
    var firstName: String = ""
    var lastName: String = ""
    var documentNumber: String = ""
    var address: String = ""
    var city: String = ""
    var state: String = ""
    var phoneNumber: String = ""
    var creditCard: String = ""
    var creditCards: [String] = [""]
    var bankAccount: String = ""
    var bank: String = ""
    var balance: Double = 0.00
    var pixKey: String = ""
    var email: String = ""
    var password: String = ""
    
    // MARK: - Initializers (Constructors)
    
    init(firstName: String, lastName: String, documentNumber: String, bankAccount: String, password: String) {
        // Constroi a partir do UserRequest
        self.firstName = firstName
        self.lastName = lastName
        self.documentNumber = documentNumber
        self.bankAccount = bankAccount
        self.password = password
    }
    
    init(firstName: String, lastName: String, documentNumber: String, address: String, city: String, state: String, phoneNumber: String, creditCard: String, creditCards: [String], bankAccount: String, bank: String, balance: Double, pixKey: String, email: String, password: String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.documentNumber = documentNumber
        self.address = address
        self.city = city
        self.state = state
        self.phoneNumber = phoneNumber
        self.creditCard = creditCard
        self.creditCards = creditCards
        self.bankAccount = bankAccount
        self.bank = bank
        self.balance = balance
        self.pixKey = pixKey
        self.email = email
        self.password = password
        
    }
    
    init(){}
    
}
