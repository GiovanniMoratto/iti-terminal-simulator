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
        router().view.login().showTitle()
        
        guard let documentNumber = router().controller.form().checkDocumentNumber() else { return }
        guard let password = router().controller.form().checkPassword() else { return }
        
        guard let login = router().controller.form().isValidLogin(documentNumber: documentNumber, password: password).condition else { return }
        
        router().view.login().showMessage()
        
        if login {
            guard let user = router().controller.form().isValidLogin(documentNumber: documentNumber, password: password).user else { return }
            
            guard let token = router().controller.form().getCredential(user: user) else { return }
            
            router().controller.home(token: token)
        }
        router().controller.welcome()
    }
    
}
