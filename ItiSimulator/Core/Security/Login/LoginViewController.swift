//
//  LoginViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 04/10/21.
//

import Foundation

class LoginViewController {
    
    // MARK: - Methods
    
    func process() {
        routeTo().view.login().showTitle()
        
        guard let documentNumber = routeTo().controller.form().checkDocumentNumber() else { return }
        guard let password = routeTo().controller.form().checkPassword() else { return }
        guard let login = routeTo().controller.form().isValidLogin(documentNumber, password).condition else { return }
        
        routeTo().view.login().showMessage()
        
        if login {
            guard let user = routeTo().controller.form().isValidLogin(documentNumber, password).user else { return }
            guard let token = routeTo().controller.form().getCredential(user) else { return }
            
            routeTo().controller.home(token)
        }
        routeTo().controller.welcome()
    }
    
}
