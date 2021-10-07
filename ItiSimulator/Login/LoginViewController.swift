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
        view.login().showTitle()
        
        guard let documentNumber = controller.form().checkDocumentNumber() else { return }
        guard let password = controller.form().checkPassword() else { return }
        
        guard let login = controller.form().isValidLogin(documentNumber: documentNumber, password: password).condition else { return }
        
        view.login().showMessage()
        
        if login {
            guard let user = controller.form().isValidLogin(documentNumber: documentNumber, password: password).user else { return }
            
            guard let token = controller.form().getCredential(user: user) else { return }
            
            controller.home(token: token)
        }
        controller.welcome()
    }
    
}
