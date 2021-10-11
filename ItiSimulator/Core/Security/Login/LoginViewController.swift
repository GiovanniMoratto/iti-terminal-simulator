//
//  LoginViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 04/10/21.
//

import Foundation

struct LoginViewController {
    
    // MARK: - Methods
    
    func process() {
        let view = LoginView()
        let op = UserOperations()
        
        view.showTitle()
        
        let documentNumber = op.getDocumentNumberToLogin()
        let password = op.getPassword()
        
        let login = op.isValidLogin(documentNumber, password).condition
        view.showMessage()
        
        if !login {
            routeTo().welcome()
        }
        
        guard let user = op.isValidLogin(documentNumber, password).user else { return }
        let token = op.getCredential(user)
        
        routeTo().home(token)
    }
    
}
