//
//  LoginViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 04/10/21.
//

import Foundation

class LoginViewController {
    
    // MARK: - Attributes
    
    let scene = LoginView()
    
    // MARK: - Methods
    
    func process() {
        
        scene.showTitle()
        
        scene.showDocumentForm()
        guard let document = scene.getInput() else { return }
        
        scene.showPasswordForm()
        guard let password = scene.getInput() else { return }
        
        scene.checkCredentials(document: document, password: password)
        MiniItiViewController().process()
        
    }
}
