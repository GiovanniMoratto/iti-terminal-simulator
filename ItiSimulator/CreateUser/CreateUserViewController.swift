//
//  CreateUserViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 02/10/21.
//

import Foundation

class CreateUserViewController {
    
    // MARK: - Attributes
    
    let scene = CreateUserView()
    
    // MARK: - Methods
    
    func process() {
        scene.showTitle()
        
        scene.showFirstNameForm()
        guard let firstName = scene.getInput() else { return }
        
        scene.showLastNameForm()
        guard let lastName = scene.getInput() else { return }
        
        scene.showDocumentForm()
        guard let document = scene.getInput() else { return }
        
        scene.showBankAccountForm()
        guard let bankAccount = scene.getInput() else { return }
        
        scene.showLoginForm()
        guard let login = scene.getInput() else { return }
        
        scene.showPasswordForm()
        guard let password = scene.getInput() else { return }
        
        let newUser = CreateUserModel(
            firstName: firstName,
            lastName: lastName,
            document: document,
            bankAccount: bankAccount,
            login: login,
            password: password
        )
        
        db.users.append(newUser.toModel())
        
    }
}
