//
//  MiniItiViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 04/10/21.
//

import Foundation

class MiniItiViewController {
    
    // MARK: - Attributes
    
    let scene = MiniItiView()
    
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
            case 1: break
//                PIX
            case 2: break
//                Cartão de Crédito iti
            case 3: break
//                Pagar e Transferir
            case 4: break
//                Colocar Dinheiro
            case 5: break
//                Gerenciar Cartões
            case 6: break
//                Gerenciar Perfil
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
