//
//  PaymentViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

struct PaymentViewController {
    
    // MARK: - Methods
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        let scene = PaymentView()
        let view = UserView()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            
            routeTo().bank().payment(token)
            
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
