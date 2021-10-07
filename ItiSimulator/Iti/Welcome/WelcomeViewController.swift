//
//  WelcomeViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 01/10/21.
//

import Foundation

class WelcomeViewController {
    
    // MARK: - Methods
    
    func process() {
        var loop = true
        
        while loop {
            routeTo().view.welcome().showTitle()
            routeTo().view.welcome().showMenu()
            
            guard let input = routeTo().view.label().getInput() else { return }
            let option = Int(input)
            
            switch option {
            case 0:
                routeTo().view.welcome().showExit()
                loop = false
            case 1:
                routeTo().controller.login()
            case 2:
                routeTo().controller.create()
            case 3:
                routeTo().controller.database()
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
}
