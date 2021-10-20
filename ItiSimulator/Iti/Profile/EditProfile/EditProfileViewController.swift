//
//  EditProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

struct EditProfileViewController {
    
    // MARK: - Attributes
    
    private let view: EditProfileView
    private let userViewComponent: UserViewComponentProtocol
    private let userOperationComponent: UserOperationComponentProtocol
    
    // MARK: - Initializers (Constructors)
    
    init(view: EditProfileView, userViewComponent: UserViewComponentProtocol, userOperationComponent: UserOperationComponentProtocol) {
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
            
            switch userViewComponent.getNavigation() {
            case 1:
                userOperationComponent.updateUser(.name, view)
            case 2:
                userOperationComponent.updateUser(.address, view)
            case 3:
                userOperationComponent.updateUser(.city, view)
            case 4:
                userOperationComponent.updateUser(.state, view)
            case 0:
                scenes = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
