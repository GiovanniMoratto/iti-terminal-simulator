//
//  ControllerRoutesProtocol.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 19/10/21.
//

import Foundation

protocol RoutesComponentProtocol {
    
    /* Initial */
    
    func welcome()
    
    func home()
    
    /* Security */
    
    func login()
    
    /* Profile */
    
    func profileMenu()
    
    func createProfile()
    
    func displayProfile()
    
    func editProfile()
    
    func deleteProfile()
    
    /* Bank Services */
    
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
    
    /* Database */
    
    func database()
    
    /* System */
    
    func system()
    
}
