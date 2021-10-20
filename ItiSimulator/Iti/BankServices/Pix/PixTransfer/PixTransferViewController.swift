//
//  PixTransferViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 13/10/21.
//

import Foundation

struct PixTransferViewController {
    
    // MARK: - Attributes
    
    private let view: PixTransferView
    private let userViewComponent: UserViewComponentProtocol
    private let bankOperationComponent: BankOperationComponentProtocol
    
    // MARK: - Initializers (Constructors)
    
    init(view: PixTransferView, userViewComponent: UserViewComponentProtocol, bankOperationComponent: BankOperationComponentProtocol) {
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
                bankOperationComponent.transferWithPix(.CPF)
            case 2:
                bankOperationComponent.transferWithPix(.email)
            case 3:
                bankOperationComponent.transferWithPix(.phoneNumber)
            case 0:
                scenes = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
