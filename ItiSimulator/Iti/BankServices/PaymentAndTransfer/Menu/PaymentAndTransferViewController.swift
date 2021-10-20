//
//  PaymentAndTransferViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

struct PaymentAndTransferViewController {
    
    // MARK: - Attributes
    
    private let view: PaymentAndTransferView
    private let userViewComponent: UserViewComponentProtocol
    
    // MARK: - Initializers (Constructors)
   
    init(view: PaymentAndTransferView, userViewComponent: UserViewComponentProtocol) {
        self.view = view
        self.userViewComponent = userViewComponent
    }
    
    // MARK: - Methods
    
    func process() {
        var scenes = true
        
        while scenes {
            view.showTitle()
            view.showMenu()
            
            switch userViewComponent.getNavigation() {
            case 1:
                routeTo.payment()
            case 2:
                routeTo.transfer()
            case 0:
                scenes = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
