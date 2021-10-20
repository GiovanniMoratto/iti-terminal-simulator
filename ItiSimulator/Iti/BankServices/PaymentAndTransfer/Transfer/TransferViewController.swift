//
//  TransferViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

struct TransferViewController {
    
    // MARK: - Attributes
    
    private let view: TransferView
    private let userViewComponent: UserViewComponentProtocol
    private let bankOperationComponent: BankOperationComponentProtocol
    
    // MARK: - Initializers (Constructors)
   
    init(view: TransferView, userViewComponent: UserViewComponentProtocol, bankOperationComponent: BankOperationComponentProtocol) {
        self.view = view
        self.userViewComponent = userViewComponent
        self.bankOperationComponent = bankOperationComponent
    }
    
    // MARK: - Methods
    
    func process() {
        var scenes = true
        
        while scenes {
            view.showTitle()
            
            bankOperationComponent.transfer(view)
            
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
