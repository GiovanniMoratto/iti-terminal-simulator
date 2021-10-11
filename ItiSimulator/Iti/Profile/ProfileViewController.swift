//
//  ProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

struct ProfileViewController {
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        let scene = ProfileView()
        let op = UserOperations()
        let view = UserView()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMenu()
            
            op.overview(token)
            
            switch view.getInputNavigation() {
            case 1:
                routeTo().userDisplay(token)
            case 2:
                // Editar Perfil
                routeTo().userEdit(token)
            case 3:
                // Deletar Perfil
                routeTo().userDelete(token)
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
