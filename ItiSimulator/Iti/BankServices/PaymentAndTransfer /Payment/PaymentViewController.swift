//
//  PaymentViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 07/10/21.
//

import Foundation

class PaymentViewController {
    
    // MARK: - Methods
    
    func process(token: String?) {
        guard let tokenUnwrapped = token else { return }
        
        routeTo().view.payment().showTitle()
        
        routeTo().view.label().showHolderAccountLabel()
        
        guard let accountNumber = routeTo().controller.form().getHolderAccountNumberAuto(token: tokenUnwrapped) else { return }
        routeTo().view.label().showHolderAccountNumberLabel(accountNumber: accountNumber)
        
        guard let branch = routeTo().controller.form().getHolderAccountBranchAuto(token: tokenUnwrapped) else { return }
        routeTo().view.label().showHolderAccountBranchLabel(branch: branch)
        
        guard let payment = routeTo().controller.form().setPayment(token: tokenUnwrapped) else { return }
        
        if !payment {
            print("erro")
        }
        
        var loop = true
        
        while loop {
            
            guard let input = routeTo().view.label().getInput() else { return }
            let option = Int(input)
            
            switch option {
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
        
}
