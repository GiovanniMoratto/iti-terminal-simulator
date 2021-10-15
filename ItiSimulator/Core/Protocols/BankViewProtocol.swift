//
//  BankViewProtocol.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

protocol BankViewProtocol {
    
    // MARK: - Methods
    
    /* Request Labels Messages */
    
    func valueRequest()
    
    func cpfRequest()
    
    func emailRequest()
    
    func phoneRequest()
    
    func confirmDataRequest()
    
    /* Display Labels Messages */
    
    func originAccount()
    
    func holderAccount(_ firstName: String, _ lastName: String, _ documentNumber: String, _ bank: String, _ branch: Int, _ account: Int, _ balance: Double)
    
    func destinationAccount()
    
    func payeeAccount(_ firstName: String, _ lastName: String, _ bank: String, _ branch: Int, _ account: Int)
    
    func value(_ value: Double)
    
    func paymentValue(_ value: Double)
    
    /* Custom Labels Messages */
    
    func confirmDataPayment()
    
    func confirmDataTransfer()
    
    func successfullyMessageOfTransfer()
    
    func successfullyMessageOfPayment()
    
    func currentBalance(_ balance: Double)
    
    /* Input Labels */
    
    func getInputAsDouble() -> Double?
    
    func getInputAsInt() -> Int?
}
