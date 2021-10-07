//
//  DeleteAccountViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

class DeleteProfileViewController {
    
    // MARK: - Methods
    
    func process(token: String?) {
        guard let tokenUnwrapped = token else { return }
        
        router().view.deleteProfile().showTitle()
        router().view.deleteProfile().showMessage()
        
        var loop = true
        
        while loop {
            
            guard let input = router().view.label().getInput() else { return }
            let option = Int(input)
            
            switch option {
            case 0:
                loop = false
            case 1:
                loop = false

                guard let database = db.delete(token: tokenUnwrapped) else { return }
               
                if !database {
                    print("Desculpe, estamos com problemas")
                }
                
                router().view.deleteProfile().showSuccessfullyDeleted()
                
                router().controller.welcome()
            default:
                print("Por favor, escolha uma operação")
            }
        }
        
    }
}
