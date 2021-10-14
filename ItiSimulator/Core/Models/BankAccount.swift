//
//  BankAccountModel.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 07/10/21.
//

import Foundation

class BankAccount {
    
    // MARK: - Attributes
    
    var bank: String
    var branch: Int
    var account: Int
    var balance = Double()
    var creditCards = [CreditCard]()
    var pix = [[PixType:String]]()
    
    // MARK: - Initializers (Constructors)
    
    init () {
        self.bank = "Itaú Unibanco"
        self.branch = Int.random(in: 1000...6000)
        self.account = Int.random(in: 10000...60000)
    }
    
    init(bank: String, branch: Int, account: Int, balance: Double, creditCards: [CreditCard], pix: [[PixType:String]]) {
        
        self.bank = bank
        self.branch = branch
        self.account = account
        self.balance = balance
        self.creditCards = creditCards
        self.pix = pix
    }
    
    // MARK: - Methods
    
    // TODO: Implementar enum para banco e agência e método para geração de conta bancária
}
