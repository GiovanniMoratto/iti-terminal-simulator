//
//  Routes.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 06/10/21.
//

import Foundation

struct ControllerRoutes {
    
    // MARK: - Methods
    
    func welcome() {
        WelcomeViewController().process()
    }
    
    func createProfile() {
        CreateProfileViewController().process()
    }
    
    func login() {
        LoginViewController().process()
    }
    
    func home(_ token: String) {
        HomeViewController().process(token)
    }
    
    func profileMenu(_ token: String) {
        ProfileMenuViewController().process(token)
    }
    
    func displayProfile(_ token: String) {
        DisplayProfileViewController().process(token)
    }
    
    func deleteProfile(_ token: String) {
        DeleteProfileViewController().process(token)
    }
    
    func editProfile(_ token: String) {
        EditProfileViewController().process(token)
    }
    
    func paymentAndTransfer(_ token: String) {
        PaymentAndTransferViewController().process(token)
    }
    
    func payment(_ token: String) {
        PaymentViewController().process(token)
    }
    
    func transfer(_ token: String) {
        TransferViewController().process(token)
    }
    
    func displayAccount(_ token: String) {
        DisplayBankViewController().process(token)
    }
    
    func pixMenu(_ token: String) {
        PixMenuViewController().process(token)
    }
    
    func pixRegister(_ token: String) {
        PixKeyRegisterViewController().process(token)
    }
    
    func pixDelete(_ token: String) {
        PixKeyDeleteViewController().process(token)
    }
    
    func pixTransfer(_ token: String) {
        PixTransferViewController().process(token)
    }
    
    func pixPaymentMenu(_ token: String) {
        PixPaymentMenuViewController().process(token)
    }
    
    func pixPaymentQRCode(_ token: String) {
        PixPaymentQRCodeViewController().process(token)
    }
    
    func pixPaymentPay(_ token: String) {
        PixPaymentPayViewController().process(token)
    }
    
    func user() -> UserViewController {
        return UserViewController()
    }
    
    func bank() -> BankViewController {
        return BankViewController()
    }
    
    func database() {
        DatabaseViewController().process()
    }
    
    func system() {
        SystemViewController().process()
    }
    
}
