//
//  ProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

class ProfileViewController {
    
    // MARK: - Methods
    
    func process(token: String?) {
        guard let tokenUnwrapped = token else { return }
        
        var loop = true
        
        while loop {
            router().view.profile().showTitle()
            router().view.profile().showMenu()
            
            guard let input = router().view.label().getInput() else { return }
            let option = Int(input)
            
            switch option {
            case 0:
                loop = false
            case 1:
                // Exibir informações
                router().controller.displayProfile(token: tokenUnwrapped)
            case 2:
                // Editar informações
                router().controller.editProfile(token: tokenUnwrapped)
            case 3:
                // Excluir conta
                router().controller.deleteProfile(token: tokenUnwrapped)
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
