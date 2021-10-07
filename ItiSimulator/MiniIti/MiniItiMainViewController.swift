//
//  MiniItiViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 04/10/21.
//

import Foundation

class MiniItiMainViewController {
    
    // MARK: - Methods
    
    func process(user: UserModel?) {
        guard let userUnwrapped = user else { return }
        
        var loop = true
        
        while loop {
            view.miniIti().showTitle()
            view.miniIti().showMenu()
            
            view.label().showPersonalInfoLabel(
                firstName: userUnwrapped.firstName,
                lastName: userUnwrapped.lastName,
                balance: userUnwrapped.balance)
            
            guard let input = view.label().getInput() else { return }
            let option = Int(input)
            
            switch option {
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
                // Gerenciar Perfil
                controller.manageProfile(user: userUnwrapped)
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
