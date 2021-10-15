//
//  ProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

struct ProfileMenuViewController {
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        let scene = ProfileMenuView()
        let view = UserView()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMenu()
            
            routeTo().user().overview(token)
            
            switch view.getNavigation() {
            case 1:
                routeTo().displayProfile(token)
            case 2:
                routeTo().editProfile(token)
            case 3:
                routeTo().deleteProfile(token)
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
