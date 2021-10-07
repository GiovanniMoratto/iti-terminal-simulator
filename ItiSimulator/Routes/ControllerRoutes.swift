//
//  Routes.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 06/10/21.
//

import Foundation

class ControllerRoutes {
    
    // MARK: - Methods
    
    func miniIti(user: UserModel?) {
        guard let userUnwrapped = user else { return }
        MiniItiMainViewController().process(user: userUnwrapped)
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
    
    func manageProfile(user: UserModel?) {
        guard let userUnwrapped = user else { return }
        ManageProfileViewController().process(user: userUnwrapped)
    }
    
    func createUser() {
        CreateUserViewController().process()
    }
    
    func database() {
        DatabaseViewController().process()
    }
    
    func displayProfile(user: UserModel?) {
        guard let userUnwrapped = user else { return }
        DisplayProfileViewController().process(user: userUnwrapped)
    }
    
    func editProfile(user: UserModel?) {
        guard let userUnwrapped = user else { return }
        EditProfileViewController().process(user: userUnwrapped)
    }
    
    func deleteAccount(user: UserModel?) {
        guard let userUnwrapped = user else { return }
        DeleteAccountViewController().process(user: userUnwrapped)
    }
    
}
