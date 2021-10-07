//
//  HomeViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 04/10/21.
//

import Foundation

class HomeViewController {
    
    // MARK: - Methods
    
    func process(token: String?) {
        guard let tokenUnwrapped = token else { return }
        
        var loop = true
        
        while loop {
            routeTo().view.home().showTitle()
            routeTo().view.home().showMenu()
            
            guard let firstName = routeTo().controller.form().getPersonalInfo(token: tokenUnwrapped).firstName else { return }
            guard let lastName = routeTo().controller.form().getPersonalInfo(token: tokenUnwrapped).lastName else { return }
            guard let balance = routeTo().controller.form().getPersonalInfo(token: tokenUnwrapped).balance else { return }
            
            routeTo().view.label().showOverviewLabel(firstName: firstName, lastName: lastName, balance: balance)
            
            guard let input = routeTo().view.label().getInput() else { return }
            let option = Int(input)
            
            switch option {
            case 0:
                loop = false
            case 1: break
                //                PIX
            case 2: break
                //                Cartão de Crédito iti
            case 3:
                //                Pagar e Transferir
                routeTo().controller.paymentAndTransfer(token: tokenUnwrapped)
            case 4: break
                //                Colocar Dinheiro
            case 5: break
                //                Gerenciar Cartões
            case 6:
                routeTo().controller.profile(token: tokenUnwrapped)
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
