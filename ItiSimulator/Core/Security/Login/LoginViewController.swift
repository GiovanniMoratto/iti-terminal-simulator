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
        let scene = LoginView()
        let op = UserViewController()
        
        scene.showTitle()
        
        let documentNumber = getDocumentNumberToLogin()
        let password = op.getPassword()
        
        let login = isValidLogin(documentNumber, password).condition
        
        scene.showMessage()
        
        if !login {
            routeTo().welcome()
        }
        
        guard let user = isValidLogin(documentNumber, password).user else { return }
        let token = getCredential(user)
        
        routeTo().home(token)
    }
        
    private func getDocumentNumberToLogin() -> String {
        let view = UserView()
        
        view.documentNumberRequest()
        
        guard let documentNumber = view.getInput(),
              documentNumber.notEmpty("'CPF'"), documentNumber.isValidCpf()
        else { return getDocumentNumberToLogin() }
        
        return documentNumber
    }
    
    private func isValidLogin(_ documentNumber: String, _ password: String) -> (condition: Bool, user: User?) {
                
        guard let user = db.findUserByDocumentNumber(documentNumber)
        else { print("CPF não cadastrado!\n"); return (false, nil) }
        
        if user.password != password {
            print("Senha Inválida!")
            return (false, nil)
        }
        
        return (true, user)
    }
    
    func getCredential(_ user: User) -> String {
        
        let credential = UserAccess(token: String().tokenGenerator, user: user)
        
        db.save(credential)
        
        return credential.token
    }
    
}
