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
    var agency = Int()
    var account = Int()
    var balance = Double()
    var creditCards = [CreditCard]()
    var pixKeys = [Pix]()
    
    // MARK: - Initializers (Constructors)
    
    init(){}
    
    init(bank: String, agency: Int, account: Int, balance: Double, creditCards: [CreditCard], pixKeys: [Pix]) {
        
        self.bank = bank
        self.agency = agency
        self.account = account
        self.balance = balance
        self.creditCards = creditCards
        self.pixKeys = pixKeys
    }
}
