//
//  CreateProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 02/10/21.
//

import Foundation

struct CreateProfileViewController {
    
    // MARK: - Methods
    
    func process() {
        let scene = CreateProfileView()
        let op = UserViewController()
        let login = LoginViewController()
        
        scene.showTitle()
        
        let newUser = User(
            firstName: op.getFirstName(),
            lastName: op.getLastName(),
            documentNumber: op.getDocumentNumber(),
            password: op.getPassword()
        )
        
        db.save(newUser)
        
        let token = login.getCredential(newUser)
        
        routeTo().home(token)
    }
}
