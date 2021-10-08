//
//  HomeViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 04/10/21.
//

import Foundation

class HomeViewController {
    
    // MARK: - Methods
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        var loop = true
        
        while loop {
            routeTo().view.home().showTitle()
            routeTo().view.home().showMenu()
            
            guard let firstName = routeTo().controller.form().getOverview(token).firstName else { return }
            guard let lastName = routeTo().controller.form().getOverview(token).lastName else { return }
            guard let balance = routeTo().controller.form().getOverview(token).balance else { return }
            
            routeTo().view.label().showOverview(firstName, lastName, balance)
            
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
                routeTo().controller.paymentAndTransfer(token)
            case 4: break
                //                Colocar Dinheiro
            case 5: break
                //                Gerenciar Cartões
            case 6:
                routeTo().controller.profile(token)
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
