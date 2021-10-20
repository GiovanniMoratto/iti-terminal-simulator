//
//  InsertMoney.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 13/10/21.
//

import Foundation

struct DisplayBankViewController {
    
    // MARK: - Attributes
    
    private let view: DisplayBankView
    private let userViewComponent: UserViewComponentProtocol
    private let bankOperationComponent: BankOperationComponentProtocol
    
    // MARK: - Initializers (Constructors)
    
    init(view: DisplayBankView, userViewComponent: UserViewComponentProtocol, bankOperationComponent: BankOperationComponentProtocol) {
        self.view = view
        self.userViewComponent = userViewComponent
        self.bankOperationComponent = bankOperationComponent
    }
    
    // MARK: - Methods
    
    func process() {
        var scenes = true
        
        while scenes {
            view.showTitle()
            view.myData()
            
            bankOperationComponent.readBankAccount(view)
            userViewComponent.exit()
            
            switch userViewComponent.getNavigation() {
            case 0:
                scenes = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
