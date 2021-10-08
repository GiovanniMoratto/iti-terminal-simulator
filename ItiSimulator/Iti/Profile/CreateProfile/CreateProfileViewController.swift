//
//  CreateProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 02/10/21.
//

import Foundation

class CreateProfileViewController {
    
    // MARK: - Methods
    
    func process() {
        routeTo().view.createProfile().showTitle()
        
        guard let firstName = routeTo().controller.form().getFirstName() else { return }
        guard let lastName = routeTo().controller.form().getLastName() else { return }
        guard let documentNumber = routeTo().controller.form().getDocumentNumber() else { return }
        guard let password = routeTo().controller.form().getPassword() else { return }
        
        let newUser = User(
            firstName: firstName,
            lastName: lastName,
            documentNumber: documentNumber,
            password: password
        )
        
        guard let database = db.saveUser(newUser) else { return }
        
        if !database {
            print("Desculpe, estamos com problemas")
        }
        
        guard let user = routeTo().controller.form().isValidLogin(documentNumber, password).user else { return }
        
        guard let token = routeTo().controller.form().getCredential(user) else { return }
        
        routeTo().controller.home(token)
    }
    
}
