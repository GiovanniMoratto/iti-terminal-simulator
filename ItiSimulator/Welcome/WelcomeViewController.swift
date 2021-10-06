//
//  WelcomeViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 01/10/21.
//

import Foundation

class WelcomeViewController {
    
    // MARK: - Attributes
    
    let scene = WelcomeView()
    
    // MARK: - Methods
    
    func process() {
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMenu()
            
            guard let inputString = scene.getInput() else { return }
            let input = Int(inputString)
            
            switch input {
            case 0:
                loop = false
                scene.showExit()
            case 1:
                LoginViewController().process()
            case 2:
                CreateUserViewController().process()
            case 3:
                DatabaseViewController().process()
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
