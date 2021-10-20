//
//  PixRegisterViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 13/10/21.
//

import Foundation

struct PixKeyRegisterViewController {
    
    // MARK: - Attributes
    
    private let view: PixKeyRegisterView
    private let userViewComponent: UserViewComponentProtocol
    private let bankOperationComponent: BankOperationComponentProtocol
    
    // MARK: - Initializers (Constructors)
    
    init(view: PixKeyRegisterView, userViewComponent: UserViewComponentProtocol, bankOperationComponent: BankOperationComponentProtocol) {
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
                bankOperationComponent.registerPixKey(.CPF, view)
            case 2:
                bankOperationComponent.registerPixKey(.email, view)
            case 3:
                bankOperationComponent.registerPixKey(.phoneNumber, view)
            case 0:
                scenes = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
