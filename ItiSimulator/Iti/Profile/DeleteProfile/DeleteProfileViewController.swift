//
//  DeleteAccountViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

class DeleteProfileViewController {
    
    // MARK: - Methods
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        routeTo().view.deleteProfile().showTitle()
        routeTo().view.deleteProfile().showMessage()
        
        var loop = true
        
        while loop {
            
            guard let input = routeTo().view.label().getInput() else { return }
            let option = Int(input)
            
            switch option {
            case 0:
                loop = false
            case 1:
                loop = false

                guard let database = db.deleteUser(token) else { return }
               
                if !database {
                    print("Desculpe, estamos com problemas")
                }
                
                routeTo().view.deleteProfile().showSuccessfullyDeleted()
                
                routeTo().controller.welcome()
            default:
                print("Por favor, escolha uma operação")
            }
        }
        
    }
}
