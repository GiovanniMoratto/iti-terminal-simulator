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
        
        router().view.payment().showTitle()
    }
        
}
