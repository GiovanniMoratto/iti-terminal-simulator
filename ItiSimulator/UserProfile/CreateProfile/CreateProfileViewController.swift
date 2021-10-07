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
        view.create().showTitle()
        
        guard let firstName = controller.form().getFirstName() else { return }
        guard let lastName = controller.form().getLastName() else { return }
        guard let documentNumber = controller.form().getDocumentNumber() else { return }
        guard let password = controller.form().getPassword() else { return }
        
        let newUser = User(
            firstName: firstName,
            lastName: lastName,
            documentNumber: documentNumber,
            password: password
        )
        
        guard let database = db.save(user: newUser) else { return }
        
        if !database {
            print("Desculpe, estamos com problemas")
        }
        
        guard let user = controller.form().isValidLogin(documentNumber: documentNumber, password: password).user else { return }
        
        guard let token = controller.form().getCredential(user: user) else { return }
        
        controller.home(token: token)
    }
    
}
