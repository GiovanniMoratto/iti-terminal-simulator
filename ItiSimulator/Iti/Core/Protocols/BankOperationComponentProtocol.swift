//
//  BankOperationProtocol.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

protocol BankOperationComponentProtocol {
    
    // MARK: - Methods
    
    /// Method responsible for Payment requesting
    func payment()

    /// Method responsible for Transfer requesting
    ///
    /// - Parameter view: The view for display
    func transfer(_ view: TransferView)
    
    /// Method responsible for Display of bank account data requesting
    ///
    /// - Parameter view: The view for display
    func readBankAccount(_ view: DisplayBankView)
    
    /// Method responsible for Register of PIX key requesting
    ///
    /// - Parameter type: The PIX key type (CPF, email, phone
    /// - Parameter view: The view for display)
    func registerPixKey(_ type: PixType, _ view: PixKeyRegisterView)
    
    /// Method responsible for Delete of PIX key requesting
    ///
    /// - Parameter type: The PIX key type (CPF, email, phone)
    /// - Parameter view: The view for display
    func deletePixKey(_ type: PixType, _ view: PixKeyDeleteView)
    
    /// Method responsible for PIX Transfer requesting
    ///
    /// - Parameter type: The PIX key type (CPF, email, phone)
    func transferWithPix(_ type: PixType)
    
    /// Method responsible for Create of QR Code requesting
    ///
    /// - Parameter type: The PIX key type (CPF, email, phone)
    /// - Parameter view: The view for display
    func createQRCodeWithPix(_ type: PixType, _ view: PixPaymentQRCodeView)
    
    /// Method responsible for PIX Payment requesting
    ///
    /// - Parameter view: The view for display
    func paymentWithPix(_ view: PixPaymentPayView)
    
}
