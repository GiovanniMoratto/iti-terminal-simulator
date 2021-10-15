//
//  EditProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

struct EditProfileViewController {
    
    // MARK: - Methods
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        let scene = EditProfileView()
        let view = UserView()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMenu()
            
            switch view.getNavigation() {
            case 1:
                routeTo().user().usernameUpdated(token)
            case 2:
                routeTo().user().addressUpdated(token)
            case 3:
                routeTo().user().cityUpdated(token)
            case 4:
                routeTo().user().stateUpdated(token)
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
            
        }
    }
}
