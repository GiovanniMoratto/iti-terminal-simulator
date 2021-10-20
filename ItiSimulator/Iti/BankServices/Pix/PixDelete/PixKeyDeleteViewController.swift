//
//  PixKeyDeleteViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 13/10/21.
//

import Foundation

struct PixKeyDeleteViewController {
    
    // MARK: - Attributes
    
    private let view: PixKeyDeleteView
    private let userViewComponent: UserViewComponentProtocol
    private let bankOperationComponent: BankOperationComponentProtocol
    
    // MARK: - Initializers (Constructors)
    
    init(view: PixKeyDeleteView, userViewComponent: UserViewComponentProtocol, bankOperationComponent: BankOperationComponentProtocol) {
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
                bankOperationComponent.deletePixKey(.CPF, view)
            case 2:
                bankOperationComponent.deletePixKey(.email, view)
            case 3:
                bankOperationComponent.deletePixKey(.phoneNumber, view)
            case 0:
                scenes = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
