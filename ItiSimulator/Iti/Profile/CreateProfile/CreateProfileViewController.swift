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
        let login = LoginViewController()
        
        scene.showTitle()
        
        let newUser = User(
            firstName: routeTo().user().getFirstName(),
            lastName: routeTo().user().getLastName(),
            documentNumber: routeTo().user().getDocumentNumber(),
            password: routeTo().user().getPassword()
        )
        
        db.save(newUser)
        
        let token = login.getCredential(newUser)
        
        routeTo().home(token)
    }
}
