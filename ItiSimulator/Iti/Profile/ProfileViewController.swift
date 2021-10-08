//
//  ProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

class ProfileViewController {
    
    // MARK: - Methods
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        var loop = true
        
        while loop {
            routeTo().view.profile().showTitle()
            routeTo().view.profile().showMenu()
            
            guard let input = routeTo().view.label().getInput() else { return }
            let option = Int(input)
            
            switch option {
            case 0:
                loop = false
            case 1:
                // Exibir informações
                routeTo().controller.displayProfile(token)
            case 2:
                // Editar informações
                routeTo().controller.editProfile(token)
            case 3:
                // Excluir conta
                routeTo().controller.deleteProfile(token)
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
