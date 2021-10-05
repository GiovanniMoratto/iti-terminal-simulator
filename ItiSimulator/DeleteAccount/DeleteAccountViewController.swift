//
//  DeleteAccountViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

class DeleteAccountViewController {
    
    // MARK: - Attributes
    
    let scene = DeleteAccountView()
    
    // MARK: - Methods
    
    func process(user: UserModel?) {
        guard let userUnwrapped = user else { return }
        
        scene.showTitle()
        scene.showMessage()
        
        var loop = true
        while loop {
            guard let inputString = scene.getInput() else { return }
            let input = Int(inputString)
            
            switch input {
            case 0:
                loop = false
            case 1:
                loop = false
                guard let database = db.delete(user: userUnwrapped) else { return }
                if !database {
                    print("Desculpe, estamos com problemas")
                }
                scene.showSuccessfullyDeleted()
                WelcomeViewController().process()
            default:
                print("Por favor, escolha uma operação")
            }
        }
        
    }
}
