//
//  PixPaymentPayViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 14/10/21.
//

import Foundation

struct PixPaymentPayViewController {
    
    // MARK: - Attributes
    
    private let view: PixPaymentPayView
    private let userViewComponent: UserViewComponentProtocol
    private let bankOperationComponent: BankOperationComponentProtocol
    
    // MARK: - Initializers (Constructors)
    
    init(view: PixPaymentPayView, userViewComponent: UserViewComponentProtocol, bankOperationComponent: BankOperationComponentProtocol) {
        self.view = view
        self.userViewComponent = userViewComponent
        self.bankOperationComponent = bankOperationComponent
    }
    
    // MARK: - Methods
    
    func process() {
        var scenes = true
        
        while scenes {
            view.showTitle()
            
            bankOperationComponent.paymentWithPix(view)
            
            switch userViewComponent.getNavigation() {
            case 0:
                userViewComponent.exitDisplay()
                scenes = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
