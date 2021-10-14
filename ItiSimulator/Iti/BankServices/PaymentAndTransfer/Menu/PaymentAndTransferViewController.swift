//
//  PaymentAndTransferViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

struct PaymentAndTransferViewController {
    
    // MARK: - Methods
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        let scene = PaymentAndTransferView()
        let view = UserView()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMenu()
            
            switch view.getNavigation() {
            case 0:
                loop = false
            case 1:
                routeTo().payment(token)
            case 2:
                routeTo().transfer(token)
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
