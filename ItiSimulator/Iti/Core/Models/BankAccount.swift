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
    var pix = [[PixType:String]]()
    
    // MARK: - Initializers (Constructors)
    
    init () {
        self.bank = "Itaú Unibanco"
        self.branch = Int.random(in: 1000...6000)
        self.account = Int.random(in: 10000...60000)
    }
    
    init(bank: String, branch: Int, account: Int, balance: Double, pix: [[PixType:String]]) {
        // Utilizado para inicializar a aplicação com dados no banco
        self.bank = bank
        self.branch = branch
        self.account = account
        self.balance = balance
        self.pix = pix
    }
    
}
