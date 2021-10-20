//
//  CreateProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 02/10/21.
//

import Foundation

struct CreateProfileViewController {
    
    // MARK: - Attributes
    
    private let view: CreateProfileView
    private let userOperationComponent: UserOperationComponentProtocol
    private let loginComponent: LoginComponentProtocol
    
    // MARK: - Initializers (Constructors)
   
    init(view: CreateProfileView, userOperationComponent: UserOperationComponentProtocol, loginComponent: LoginComponentProtocol) {
        self.view = view
        self.userOperationComponent = userOperationComponent
        self.loginComponent = loginComponent
    }
    
    // MARK: - Methods
    
    func process() {
        view.showTitle()
        
        let newUser = userOperationComponent.createUser()
        
        loginComponent.getCredential(newUser)
        
        routeTo.home()
    }
}
