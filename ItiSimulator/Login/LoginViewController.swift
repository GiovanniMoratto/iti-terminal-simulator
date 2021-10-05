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
    let valid = FieldsValidations()
    
    // MARK: - Methods
    
    func process() {
        scene.showTitle()
        scene.showMessage()
        
        let documentNumber = checkDocumentNumber(field: "'CPF'")
        let password = checkPassword(field: "'senha'")
        
        guard let validLogin = isValidLogin(documentNumber: documentNumber, password: password).condition else { return }
        
        if validLogin {
            guard let user = isValidLogin(documentNumber: documentNumber, password: password).user else { return }
            
            MiniItiMainViewController().process(user: user)
        }
        
        WelcomeViewController().process()
    }
    
    func checkDocumentNumber(field: String?) -> String? {
        guard let fieldUnwrapped = field else { return nil }
        
        scene.showDocumentNumberForm()
        
        guard let documentNumber = scene.getInput(),
              valid.notEmpty(field: fieldUnwrapped, value: documentNumber) ?? false,
              valid.cpf(field: fieldUnwrapped, value: documentNumber) ?? false
        else { return LoginViewController().checkDocumentNumber(field: fieldUnwrapped)}
        
        return documentNumber
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
    
    func isValidLogin(documentNumber: String?, password: String?) -> (condition: Bool?, user: UserModel?) {
        guard let documentNumberUnwrapped = documentNumber else { return (nil, nil)}
        guard let passwordUnwrapped = password else { return (nil, nil)}
        
        guard let user = db.findByDocumentNumber(documentNumber: documentNumberUnwrapped) else { return (nil, nil)}
        
        if user.password != passwordUnwrapped {
            print("Senha Inválida!")
            return (false, UserModel())
        }
        return (true, user)
    }
}
