//
//  PixPaymentQRCodeViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 14/10/21.
//

import Foundation

struct PixPaymentQRCodeViewController {
    
    // MARK: - Attributes
    
    private let view: PixPaymentQRCodeView
    private let userViewComponent: UserViewComponentProtocol
    private let bankOperationComponent: BankOperationComponentProtocol
    
    // MARK: - Initializers (Constructors)
    
    init(view: PixPaymentQRCodeView, userViewComponent: UserViewComponentProtocol, bankOperationComponent: BankOperationComponentProtocol) {
        self.view = view
        self.userViewComponent = userViewComponent
        self.bankOperationComponent = bankOperationComponent
    }
    
    // MARK: - Methods
    
    func process() {
        var scenes = true
        
        while scenes {
            view.showTitle()
            view.showMenu()
            
            switch userViewComponent.getNavigation() {
            case 1:
                bankOperationComponent.createQRCodeWithPix(.CPF, view)
            case 2:
                bankOperationComponent.createQRCodeWithPix(.email, view)
            case 3:
                bankOperationComponent.createQRCodeWithPix(.phoneNumber, view)
            case 0:
                scenes = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
