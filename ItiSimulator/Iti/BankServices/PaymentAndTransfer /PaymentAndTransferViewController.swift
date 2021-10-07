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
            router().view.paymentAndTransfer().showTitle()
            router().view.paymentAndTransfer().showMenu()
            
            guard let input = router().view.label().getInput() else { return }
            let option = Int(input)
            
            switch option {
            case 0:
                loop = false
            case 1: break
                // Pagar
            case 2: break
                // Transferir
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
