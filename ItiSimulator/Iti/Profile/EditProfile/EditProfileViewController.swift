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
        let op = UserOperation()
        let view = UserView()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMenu()
            
            op.overview(token)
            
            switch view.getNavigation() {
            case 1:
                op.usernameUpdated(token)
                scene.successfullyUpdateMessage()
            case 2:
                op.addressUpdated(token)
                scene.successfullyUpdateMessage()
            case 3:
                op.cityUpdated(token)
                scene.successfullyUpdateMessage()
            case 4:
                op.stateUpdated(token)
                scene.successfullyUpdateMessage()
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
            
        }
    }
}
