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
            router().view.welcome().showTitle()
            router().view.welcome().showMenu()
            
            guard let input = router().view.label().getInput() else { return }
            let option = Int(input)
            
            switch option {
            case 0:
                router().view.welcome().showExit()
                loop = false
            case 1:
                router().controller.login()
            case 2:
                router().controller.create()
            case 3:
                router().controller.database()
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
}
