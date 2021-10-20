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
    private let userOperationComponent: UserOperationComponentProtocol
    
    // MARK: - Initializers (Constructors)
    
    init(view: LoginView, userViewComponent: UserViewComponentProtocol, userOperationComponent: UserOperationComponentProtocol) {
        self.view = view
        self.userViewComponent = userViewComponent
        self.userOperationComponent = userOperationComponent
    }
            
    // MARK: - Methods
    
    func login() -> User? {
        view.showTitle()
        
        let documentNumber = getDocumentNumberToLogin()
        let password = userOperationComponent.getPassword()
        
        view.showMessage()

        guard let user = isValidLogin(documentNumber, password) else { routeTo.welcome(); return nil }
        
        return user
    }
    
    func getCredential(_ user: User) {
        session.setToken(String().tokenGenerator)
        session.setUser(user)
    }
    
    func logout() {
        session.clearSession()
    }
    
    // MARK: - Assistants Methods
    
    /// Method responsible for sending "Document Number" Request View, receiving input and validating it
    ///
    /// - Returns: A validated document number to login
    private func getDocumentNumberToLogin() -> String {
        userViewComponent.userDocumentNumberRequest()
        
        guard let documentNumber = userViewComponent.getInput(),
              documentNumber.notEmpty("'CPF'"), documentNumber.isValidCpf()
        else { return getDocumentNumberToLogin() }
        
        return documentNumber
    }
    
    /// Method responsible for checking if the login data is valid
    ///
    /// - Parameter documentNumber: The document number that will be used in the search
    /// - Parameter password: The password that will be checked for equality
    ///
    /// - Returns: An optional of the user found
    private func isValidLogin(_ documentNumber: String, _ password: String) -> User? {
        
        guard let user = db.findUserByDocumentNumber(documentNumber)
        else { print("CPF não cadastrado!\n"); return nil }
        
        if user.password != password {
            print("Senha Inválida!")
            return nil
        }
        
        return user
    }
    
    
}
