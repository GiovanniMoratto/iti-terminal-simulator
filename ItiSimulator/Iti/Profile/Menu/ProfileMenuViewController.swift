//
//  ProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

struct ProfileMenuViewController {
    
    // MARK: - Attributes
    
    private let view: ProfileMenuView
    private let userViewComponent: UserViewComponentProtocol
    private let userOperationComponent: UserOperationComponentProtocol
    
    // MARK: - Initializers (Constructors)
    
    init(view: ProfileMenuView, userViewComponent: UserViewComponentProtocol, userOperationComponent: UserOperationComponentProtocol) {
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
                routeTo.displayProfile()
            case 2:
                routeTo.editProfile()
            case 3:
                routeTo.deleteProfile()
            case 0:
                scenes = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
