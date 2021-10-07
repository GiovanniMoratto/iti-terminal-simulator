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
            view.welcome().showTitle()
            view.welcome().showMenu()
            
            guard let input = view.label().getInput() else { return }
            let option = Int(input)
            
            switch option {
            case 0:
                view.welcome().showExit()
                loop = false
            case 1:
                controller.login()
            case 2:
                controller.create()
            case 3:
                controller.database()
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
}
