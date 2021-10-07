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
        router().view.createProfile().showTitle()
        
        guard let firstName = router().controller.form().getFirstName() else { return }
        guard let lastName = router().controller.form().getLastName() else { return }
        guard let documentNumber = router().controller.form().getDocumentNumber() else { return }
        guard let password = router().controller.form().getPassword() else { return }
        
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
        
        guard let user = router().controller.form().isValidLogin(documentNumber: documentNumber, password: password).user else { return }
        
        guard let token = router().controller.form().getCredential(user: user) else { return }
        
        router().controller.home(token: token)
    }
    
}
