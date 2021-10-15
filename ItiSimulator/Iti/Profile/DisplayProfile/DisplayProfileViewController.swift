//
//  ShowProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

struct DisplayProfileViewController {
    
    // MARK: - Methods
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        let scene = DisplayProfileView()
        let view = UserView()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            
            routeTo().user().profileInfo(token)
            view.exit()
            
            switch view.getNavigation() {
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
