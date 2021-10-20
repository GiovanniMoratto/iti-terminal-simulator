//
//  PixMenuViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 13/10/21.
//

import Foundation

struct PixMenuViewController {
    
    // MARK: - Attributes
    
    private let view: PixMenuView
    private let userViewComponent: UserViewComponentProtocol
    private let userOperationComponent: UserOperationComponentProtocol
    
    // MARK: - Initializers (Constructors)
    
    init(view: PixMenuView, userViewComponent: UserViewComponentProtocol, userOperationComponent: UserOperationComponentProtocol) {
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
                routeTo.pixPaymentMenu()
            case 2:
                routeTo.pixTransfer()
            case 3:
                routeTo.pixRegister()
            case 4:
                routeTo.pixDelete()
            case 0:
                scenes = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
