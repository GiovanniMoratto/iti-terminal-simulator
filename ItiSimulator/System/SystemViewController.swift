//
//  SystemViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 15/10/21.
//

import Foundation

struct SystemViewController {
    
    // MARK: - Methods
    
    func process() {
        let scene = SystemView()
        let view = UserView()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMenu()
            
            switch view.getNavigation() {
            case 1:
                routeTo().welcome()
            case 2:
                routeTo().database()
            case 0:
                scene.showExit()
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
}
