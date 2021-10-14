//
//  PixPaymentsMenuViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 13/10/21.
//

import Foundation

struct PixPaymentMenuViewController {
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        let scene = PixPaymentMenuView()
        let view = UserView()
    
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMenu()
            
            routeTo().user().overview(token)
            
            switch view.getNavigation() {
            case 1: break
                // Pagar
            case 2: break
                // Gerar QR Code
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
            
        }
    
    }
}
