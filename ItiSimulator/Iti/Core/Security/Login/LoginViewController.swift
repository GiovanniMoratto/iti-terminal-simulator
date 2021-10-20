//
//  LoginViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 04/10/21.
//

import Foundation

class LoginViewController {
    
    // MARK: - Attributes
    
    private let loginComponent: LoginComponentProtocol
    
    // MARK: - Initializers (Constructors)
    
    init(loginComponent: LoginComponentProtocol) {
        self.loginComponent = loginComponent
    }
    
    // MARK: - Methods
    
    func process() {
        guard let user = loginComponent.login() else { return }
        
        loginComponent.getCredential(user)
        
        routeTo.home()
    }
    
}
