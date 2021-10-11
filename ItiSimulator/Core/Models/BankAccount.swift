//
//  BankAccountModel.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 07/10/21.
//

import Foundation

class BankAccount {
    
    // MARK: - Attributes
    
    var bank = String()
    var branch = Int()
    var account = Int()
    var balance = Double()
    var creditCards = [CreditCard]()
    var pixKeys = [String]()
    
    // MARK: - Initializers (Constructors)
    
    init(){}
    
    init(bank: String, branch: Int, account: Int, balance: Double, creditCards: [CreditCard], pixKeys: [String]) {
        
        self.bank = bank
        self.branch = branch
        self.account = account
        self.balance = balance
        self.creditCards = creditCards
        self.pixKeys = pixKeys
    }
}
