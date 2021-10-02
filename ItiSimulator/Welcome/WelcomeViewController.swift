//
//  WelcomeViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 01/10/21.
//

import Foundation

class WelcomeViewController {
    
    let scene = WelcomeView()
    
    func process() {
        
        var loop = true
        
        while loop {
            
            let menuOptional = scene.showMenu()
            guard let inputString = menuOptional else { return }
            let input = Int(inputString)
            
            switch input {
            case 0:
                loop = false
                scene.showExit()
            case 1: break
//                Login
            case 2: break
//                Cadastro Conta
            default:
                print("Por favor, escolha uma operação")
            }
            
        }
    }
}
