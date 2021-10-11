//
//  ShowProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

struct DisplayUserViewController {
    
    // MARK: - Methods
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        let scene = DisplayUserView()
        let op = UserOperations()
        let view = UserView()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            op.profileInfo(token)
            
            switch view.getInputNavigation() {
            case 0:
                view.exit()
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
