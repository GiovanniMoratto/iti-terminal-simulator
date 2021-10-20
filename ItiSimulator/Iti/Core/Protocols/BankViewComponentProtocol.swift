//
//  BankViewProtocol.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

protocol BankViewComponentProtocol {
    
    // MARK: - Methods: Input Request Labels Messages
    
    /// Method responsible for requesting money amount input
    func valueRequest()
    
    /// Method responsible for requesting document number input
    func documentNumberRequest()
    
    /// Method responsible for requesting email input
    func emailRequest()
    
    /// Method responsible for requesting phone input
    func phoneRequest()
    
    /// Method responsible for requesting to proceed with the operation
    func confirmDataRequest()
    
    // MARK: - Methods: Receive Input
    
    /// Method responsible for receiving input and converting to cash value
    ///
    /// - Returns: An optional double of the value
    func getMoneyInput() -> Double?
    
    /// Method responsible for receiving input and converting to branch or bank account
    ///
    /// - Returns: An optional integer of the value
    func getInputAsInt() -> Int?
    
    // MARK: - Methods: Show Information Labels Messages
    
    /// Method responsible for displaying message to confirm payment data to the user
    func confirmDataPaymentDisplay()
    
    /// Method responsible for displaying message to confirm transfer data to the user
    func confirmDataTransferDisplay()
    
    /// Method responsible for displaying a success message after transfer
    func successfullyMessageOfTransferDisplay()
    
    /// Method responsible for displaying a success message after payment
    func successfullyMessageOfPaymentDisplay()
    
    /// Method responsible for displaying the amount to be paid by the user
    ///
    /// - Parameter value: Money to be paid
    func valueDisplay(_ value: Double)
    
    /// Method responsible for displaying the amount to be paid by someone
    ///
    /// - Parameter value: Money to be paid
    func paymentValueDisplay(_ value: Double)
    
    /// Method responsible for displaying the current balance after transactions
    ///
    /// - Parameter balance: Current User Balance
    func currentBalanceDisplay(_ balance: Double)
    
    /// Method responsible for displaying the User's Account
    ///
    /// - Parameter firstName: The User's first name
    /// - Parameter lastName: The User's last name
    /// - Parameter documentNumber: The User's document number
    /// - Parameter bank: The User's bank
    /// - Parameter branch: The User's bank account branch
    /// - Parameter account: The User's bank account
    /// - Parameter balance: The User's bank account balance
    func holderAccountDisplay(_ firstName: String, _ lastName: String, _ documentNumber: String, _ bank: String, _ branch: Int, _ account: Int, _ balance: Double)
    
    /// Method responsible for displaying the Payeer's Account
    ///
    /// - Parameter firstName: The Payeer's first name
    /// - Parameter lastName: The Payeer's last name
    /// - Parameter bank: The Payeer's bank
    /// - Parameter branch: The Payeer's bank account branch
    /// - Parameter account: The Payeer's bank account
    func payeeAccountDisplay(_ firstName: String, _ lastName: String, _ bank: String, _ branch: Int, _ account: Int)
    
}
