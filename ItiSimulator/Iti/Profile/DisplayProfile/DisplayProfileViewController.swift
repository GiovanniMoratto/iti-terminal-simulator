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
        let op = UserOperation()
        let view = UserView()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            op.profileInfo(token)
            
            switch view.getNavigation() {
            case 0:
                view.exit()
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
