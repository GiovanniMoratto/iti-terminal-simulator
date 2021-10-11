//
//  WelcomeViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 01/10/21.
//

import Foundation

struct WelcomeViewController {

    // MARK: - Methods
    
    func process() {
        let scene = WelcomeView()
        let view = UserView()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMenu()
            
            switch view.getInputNavigation() {
            case 1:
                routeTo().login()
            case 2:
                routeTo().userCreate()
            case 0:
                view.exit()
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
