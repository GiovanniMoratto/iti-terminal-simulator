//
//  CreditCard.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 07/10/21.
//

import Foundation

struct CreditCard {
    
    // MARK: - Attributes
    
    var cardNumber: Int
    var expirationDate = "12/30"
    var codeNumber: Int

    init() {
        self.cardNumber = Int.random(in: 1000000000000000...9999999999999999)
        self.codeNumber = Int.random(in: 100...999)
    }
    
    init(cardNumber: Int, expirationDate: String, codeNumber: Int) {
        self.cardNumber = cardNumber
        self.expirationDate = expirationDate
        self.codeNumber = codeNumber
    }
    
}
