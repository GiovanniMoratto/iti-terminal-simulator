//
//  PaymentViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

struct PaymentViewController {
    
    // MARK: - Attributes
    
    private let view: PaymentView
    private let userViewComponent: UserViewComponentProtocol
    private let bankOperationComponent: BankOperationComponentProtocol
    
    // MARK: - Initializers (Constructors)
    
    init(view: PaymentView, userViewComponent: UserViewComponentProtocol, bankOperationComponent: BankOperationComponentProtocol) {
        self.view = view
        self.userViewComponent = userViewComponent
        self.bankOperationComponent = bankOperationComponent
    }
    
    // MARK: - Methods
    
    func process() {
        var scenes = true
        
        while scenes {
            view.showTitle()
            
            bankOperationComponent.payment()
            
            switch userViewComponent.getNavigation() {
            case 0:
                userViewComponent.exit()
                scenes = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
