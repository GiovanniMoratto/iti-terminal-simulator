//
//  Routes.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 06/10/21.
//

import Foundation

class ControllerRoutes {
    
    // MARK: - Methods
    
    func home(token: String?) {
        guard let tokenUnwrapped = token else { return }
        HomeViewController().process(token: tokenUnwrapped)
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
    
    func profile(token: String?) {
        guard let tokenUnwrapped = token else { return }
        ProfileViewController().process(token: tokenUnwrapped)
    }
    
    func create() {
        CreateProfileViewController().process()
    }
    
    func database() {
        DatabaseViewController().process()
    }
    
    func displayProfile(token: String?) {
        guard let tokenUnwrapped = token else { return }
        DisplayProfileViewController().process(token: tokenUnwrapped)
    }
    
    func editProfile(token: String?) {
        guard let tokenUnwrapped = token else { return }
        EditProfileViewController().process(token: tokenUnwrapped)
    }
    
    func deleteProfile(token: String?) {
        guard let tokenUnwrapped = token else { return }
        DeleteProfileViewController().process(token: tokenUnwrapped)
    }
    
}
