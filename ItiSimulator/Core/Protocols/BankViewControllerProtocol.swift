//
//  BankOperationProtocol.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

protocol BankViewControllerProtocol {
    
    // MARK: - Methods
    
    /* Common Payment */
    
    func payment(_ token: String)
    
    /* Common Transfer */
    
    func transfer(_ token: String)
    
    /* Display Account */
    
    func accountInfo(_ token: String)
    
    /* PIX - Register */
    
    func registerPixKeyOfDocumentNumber(_ token: String)
    
    func registerPixKeyOfEmail(_ token: String)
    
    func registerPixKeyOfPhoneNumber(_ token: String)
    
    /* PIX - Delete */
    
    func deletePixKeyOfDocumentNumber(_ token: String)
    
    func deletePixKeyOfEmail(_ token: String)
    
    func deletePixKeyOfPhoneNumber(_ token: String)
    
    /* PIX - Transfer */
    
    func transferPixKeyOfDocumentNumber(_ token: String)
    
    func transferPixKeyOfEmail(_ token: String)
    
    func transferPixKeyOfPhoneNumber(_ token: String)
    
    /* PIX - QR Code */
    
    func QRCodePixKeyOfDocumentNumber(_ token: String)
    
    func QRCodePixKeyOfEmail(_ token: String)
    
    func QRCodePixKeyOfPhoneNumber(_ token: String)
    
    /* PIX - Payment */
    
    func paymentPixKey(_ token: String)
    
}
