//
//  PaymentAndTransferViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 07/10/21.
//

import Foundation

class PaymentAndTransferViewController {
    
    // MARK: - Methods
    
    func process(token: String?) {
        guard let tokenUnwrapped = token else { return }
        
        var loop = true
        
        while loop {
            routeTo().view.paymentAndTransfer().showTitle()
            routeTo().view.paymentAndTransfer().showMenu()
            
            guard let input = routeTo().view.label().getInput() else { return }
            let option = Int(input)
            
            switch option {
            case 0:
                loop = false
            case 1:
                // Pagar
                routeTo().controller.payment(token: tokenUnwrapped)
            case 2: break
                // Transferir
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
