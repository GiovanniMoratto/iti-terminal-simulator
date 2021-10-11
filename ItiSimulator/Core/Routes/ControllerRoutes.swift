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
    
}
