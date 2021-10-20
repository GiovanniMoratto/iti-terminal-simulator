//
//  ShowProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

struct DisplayProfileViewController {
    
    // MARK: - Attributes
    
    private let view: DisplayProfileView
    private let userViewComponent: UserViewComponentProtocol
    private let userOperationComponent: UserOperationComponentProtocol
    
    // MARK: - Initializers (Constructors)
    
    init(view: DisplayProfileView, userViewComponent: UserViewComponentProtocol, userOperationComponent: UserOperationComponentProtocol) {
        self.view = view
        self.userViewComponent = userViewComponent
        self.userOperationComponent = userOperationComponent
    }
    
    // MARK: - Methods
    
    func process() {
        var scenes = true
        
        while scenes {
            view.showTitle()
            
            userOperationComponent.readUser()
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
