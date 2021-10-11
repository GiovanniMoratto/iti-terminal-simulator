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
    
    func userCreate() {
        CreateUserViewController().process()
    }
    
    func login() {
        LoginViewController().process()
    }
    
    func home(_ token: String) {
        HomeViewController().process(token)
    }
    
    func userDisplay(_ token: String) {
        DisplayUserViewController().process(token)
    }
    
    func userEdit(_ token: String) {
        EditUserViewController().process(token)
    }
    
    func userDelete(_ token: String) {
        DeleteUserViewController().process(token)
    }
    
    func profile(_ token: String) {
        ProfileViewController().process(token)
    }
    
    func paymentAndTransfer(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        PaymentAndTransferViewController().process(token)
    }
    
    func payment(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        PaymentViewController().process(token)
    }
    
//    func transfer(token: String?) {
//        guard let tokenUnwrapped = token else { return }
//        TransferViewController().process(token: tokenUnwrapped)
//    }
    
}
