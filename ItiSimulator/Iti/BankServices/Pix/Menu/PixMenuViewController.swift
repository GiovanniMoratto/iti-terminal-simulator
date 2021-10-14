//
//  PixMenuViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 13/10/21.
//

import Foundation

struct PixMenuViewController {
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        let scene = PixMenuView()
        let view = UserView()
    
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMenu()
            
            routeTo().user().overview(token)
            
            switch view.getNavigation() {
            case 1: break
                // Pagamentos
            case 2: break
                // Transferência
            case 3:
                routeTo().pixRegister(token)
            case 4:
                routeTo().pixDelete(token)
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
            
        }
    
    }
}
