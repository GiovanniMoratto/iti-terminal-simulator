//
//  Routes.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 06/10/21.
//

import Foundation

class ControllerRoutes {
    
    // MARK: - Methods
    
    func home(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        HomeViewController().process(token)
    }
    
    func welcome() {
        WelcomeViewController().process()
    }
    
    func login() {
        LoginViewController().process()
    }
    
    func form() -> Forms {
        return Forms()
    }
    
    func profile(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        ProfileViewController().process(token)
    }
    
    func create() {
        CreateProfileViewController().process()
    }
    
    func database() {
        DatabaseViewController().process()
    }
    
    func displayProfile(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        DisplayProfileViewController().process(token)
    }
    
    func editProfile(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        EditProfileViewController().process(token)
    }
    
    func deleteProfile(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        DeleteProfileViewController().process(token)
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
