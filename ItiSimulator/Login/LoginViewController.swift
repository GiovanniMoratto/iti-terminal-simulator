//
//  LoginViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 04/10/21.
//

import Foundation

class LoginViewController {
    
    // MARK: - Attributes
    
    let scene = LoginView()
    let valid = Validations()
    
    // MARK: - Methods
    
    func process() {
        scene.showTitle()
        scene.checkCredentials()
        
        let document = checkDocument(field: "'CPF'")
        let password = checkPassword(field: "'senha'")
        
        guard let validLogin = isValidLogin(document: document, password: password).condition else { return }
        
        if validLogin {
            guard let user = isValidLogin(document: document, password: password).user else { return }
            
            MiniItiViewController().process(user: user)
        }
        
        WelcomeViewController().process()
    }
    
    func checkDocument(field: String?) -> String? {
        guard let fieldUnwrapped = field else { return nil }
        
        scene.showDocumentForm()
        
        guard let document = scene.getInput(),
              valid.notEmpty(field: fieldUnwrapped, value: document) ?? false,
              valid.cpf(field: fieldUnwrapped, value: document) ?? false
        else { return LoginViewController().checkDocument(field: fieldUnwrapped)}
        
        return document
    }
    
    func checkPassword(field: String?) -> String? {
        guard let fieldUnwrapped = field else { return nil }
        
        scene.showPasswordForm()
        
        guard let password = scene.getInput(),
              valid.notEmpty(field: fieldUnwrapped, value: password) ?? false,
              valid.isValidPassword(field: fieldUnwrapped, value: password) ?? false
        else { return LoginViewController().checkPassword(field: fieldUnwrapped)}
        
        return password
    }
    
    func isValidLogin(document: String?, password: String?) -> (condition: Bool?, user: UserModel?) {
        guard let documentUnwrapped = document else { return (nil, nil)}
        guard let passwordUnwrapped = password else { return (nil, nil)}
        guard let user = db.findByDocument(document: documentUnwrapped) else { return (nil, nil)}
        
        if user.password != passwordUnwrapped {
            print("Senha Inválida!")
            return (false, UserModel())
        }
        return (true, user)
    }
}
