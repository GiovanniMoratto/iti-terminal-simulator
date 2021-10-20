//
//  ControllerRoutesProtocol.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 19/10/21.
//

import Foundation

protocol RoutesComponentProtocol {
    
    // MARK: - Methods: Initial
    
    func welcome()
    
    func home()
    
    // MARK: - Methods: Security
    
    func login()
    
    // MARK: - Methods: Profile
    
    func profileMenu()
    
    func createProfile()
    
    func displayProfile()
    
    func editProfile()
    
    func deleteProfile()
    
    // MARK: - Methods: Bank Services
    
    func paymentAndTransfer()
    
    func payment()
    
    func transfer()
    
    func displayAccount()
    
    func pixMenu()
    
    func pixRegister()
    
    func pixDelete()
    
    func pixTransfer()
    
    func pixPaymentMenu()
    
    func pixPaymentQRCode()
    
    func pixPaymentPay()
    
    // MARK: - Methods: Database
    
    func database()
    
    // MARK: - Methods: System
    
    func system()
    
}
