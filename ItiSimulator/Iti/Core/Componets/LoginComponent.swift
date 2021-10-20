//
//  LoginComponent.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 19/10/21.
//

import Foundation

struct LoginComponent: LoginComponentProtocol {
    
    // MARK: - Attributes
    
    private let view: LoginView
    private let userViewComponent: UserViewComponentProtocol
    
    // MARK: - Initializers (Constructors)
    
    init(view: LoginView, userViewComponent: UserViewComponentProtocol) {
        self.view = view
        self.userViewComponent = userViewComponent
    }
            
    // MARK: - Methods
    
    func login() -> User? {
        view.showTitle()
        
        let documentNumber = getDocumentNumberToLogin()
        let password = getPasswordToLogin()
        
        let login = isValidLogin(documentNumber, password).condition
        
        view.showMessage()
        
        if !login {
            routeTo.welcome()
        }
        
        guard let user = isValidLogin(documentNumber, password).user else { return nil }
        
        return user
    }
    
    func getCredential(_ user: User) {
        session.setToken(String().tokenGenerator)
        session.setUser(user)
    }
    
    func logout() {
        session.clearSession()
    }
    
    /* Assistants Methods */
    
    private func getDocumentNumberToLogin() -> String {
        userViewComponent.documentNumberRequest()
        
        guard let documentNumber = userViewComponent.getInput(),
              documentNumber.notEmpty("'CPF'"), documentNumber.isValidCpf()
        else { return getDocumentNumberToLogin() }
        
        return documentNumber
    }
    
    private func getPasswordToLogin() -> String {
        userViewComponent.passwordRequest()
        
        guard let password = userViewComponent.getInput(),
              password.notEmpty("'senha'"), password.isValidPassword
        else { return getPasswordToLogin() }
        
        return password
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
    
    
}
