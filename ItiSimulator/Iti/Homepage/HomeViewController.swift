//
//  HomeViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 04/10/21.
//

import Foundation

struct HomeViewController {
    
    // MARK: - Methods
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        let scene = HomeView()
        let view = UserView()
        let op = UserOperation()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMenu()
            
            op.overview(token)
            
            switch view.getNavigation() {
            case 1: break
                // PIX
            case 2: break
                // Cartão e crédito iti
            case 3:
                routeTo().paymentAndTransfer(token)
            case 4: break
                // Colocar Dinheiro
            case 5: break
                // Gerenciar Cartões
            case 6:
                // Acessar Perfil
                routeTo().profileMenu(token)
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
