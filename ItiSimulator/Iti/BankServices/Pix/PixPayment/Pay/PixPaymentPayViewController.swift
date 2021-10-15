//
//  PixPaymentPayViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 14/10/21.
//

import Foundation

struct PixPaymentPayViewController {
    
    // MARK: - Methods
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        let scene = PixPaymentPayView()
        let view = UserView()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            
            routeTo().bank().paymentPixKey(token)
            
            switch view.getNavigation() {
            case 0:
                view.exit()
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
}
