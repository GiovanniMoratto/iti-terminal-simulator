//
//  CreateProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 02/10/21.
//

import Foundation

struct CreateUserViewController {
    
    // MARK: - Methods
    
    func process() {
        let scene = CreateUserView()
        let op = UserOperations()
        
        scene.showTitle()
        
        let newUser = User(
            firstName: op.getFirstName(),
            lastName: op.getLastName(),
            documentNumber: op.getDocumentNumber(),
            password: op.getPassword()
        )
        
        db.save(newUser)
        
        let token = op.getCredential(newUser)
        
        routeTo().home(token)
    }
}
