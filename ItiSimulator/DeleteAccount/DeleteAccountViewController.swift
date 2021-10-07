//
//  DeleteAccountViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

class DeleteAccountViewController {
    
    // MARK: - Methods
    
    func process(user: UserModel?) {
        guard let userUnwrapped = user else { return }
        
        view.deleteAccount().showTitle()
        view.deleteAccount().showMessage()
        
        var loop = true
        
        while loop {
            guard let input = view.label().getInput() else { return }
            let option = Int(input)
            
            switch option {
            case 0:
                loop = false
            case 1:
                loop = false
                guard let database = db.delete(user: userUnwrapped) else { return }
                if !database {
                    print("Desculpe, estamos com problemas")
                }
                view.deleteAccount().showSuccessfullyDeleted()
                controller.welcome()
            default:
                print("Por favor, escolha uma operação")
            }
        }
        
    }
}
