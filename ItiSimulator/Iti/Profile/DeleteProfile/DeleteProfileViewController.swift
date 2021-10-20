//
//  DeleteAccountViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

struct DeleteProfileViewController {
    
    // MARK: - Attributes
    
    private let view: DeleteProfileView
    private let userViewComponent: UserViewComponentProtocol
    private let userOperationComponent: UserOperationComponentProtocol
    
    // MARK: - Initializers (Constructors)
    
    init(view: DeleteProfileView, userViewComponent: UserViewComponentProtocol, userOperationComponent: UserOperationComponentProtocol) {
        self.view = view
        self.userViewComponent = userViewComponent
        self.userOperationComponent = userOperationComponent
    }
    
    // MARK: - Methods
    
    func process() {
        var scenes = true
        
        while scenes {
            view.showTitle()
            view.showMessage()
            
            switch userViewComponent.getNavigation() {
            case 1:
                userOperationComponent.deleteUser(view)
                break
            case 0:
                scenes = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
