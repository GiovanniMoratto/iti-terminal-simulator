//
//  MiniItiViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 04/10/21.
//

import Foundation

class MiniItiMainViewController {
    
    // MARK: - Attributes
    
    let scene = MiniItiMainView()
    
    // MARK: - Methods
    
    func process(user: UserModel?) {
        guard let userUnwrapped = user else { return }
        
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMenu()
            scene.showPersonalInfo(firstName: userUnwrapped.firstName, lastName: userUnwrapped.lastName, balance: userUnwrapped.balance)
            
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
            case 6:
                ManageProfileViewController().process(user: userUnwrapped)
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
