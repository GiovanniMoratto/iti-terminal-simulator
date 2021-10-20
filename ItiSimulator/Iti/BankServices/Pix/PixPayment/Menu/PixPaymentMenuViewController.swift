//
//  PixPaymentsMenuViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 13/10/21.
//

import Foundation

struct PixPaymentMenuViewController {
    
    // MARK: - Attributes
    
    private let view: PixPaymentMenuView
    private let userViewComponent: UserViewComponentProtocol
    private let userOperationComponent: UserOperationComponentProtocol
    
    // MARK: - Initializers (Constructors)
    
    init(view: PixPaymentMenuView, userViewComponent: UserViewComponentProtocol, userOperationComponent: UserOperationComponentProtocol) {
        self.view = view
        self.userViewComponent = userViewComponent
        self.userOperationComponent = userOperationComponent
    }
    
    // MARK: - Methods
    
    func process() {
        var scenes = true
        
        while scenes {
            view.showTitle()
            view.showMenu()
            
            userOperationComponent.overview()
            
            switch userViewComponent.getNavigation() {
            case 1:
                routeTo.pixPaymentPay()
            case 2:
                routeTo.pixPaymentQRCode()
            case 0:
                scenes = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
