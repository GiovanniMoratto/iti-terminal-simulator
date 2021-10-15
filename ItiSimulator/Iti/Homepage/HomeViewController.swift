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
        
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMenu()
            
            routeTo().user().overview(token)
            
            switch view.getNavigation() {
            case 1:
                routeTo().pixMenu(token)
            case 2:
                routeTo().paymentAndTransfer(token)
            case 3:
                routeTo().displayAccount(token)
            case 4:
                routeTo().profileMenu(token)
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
