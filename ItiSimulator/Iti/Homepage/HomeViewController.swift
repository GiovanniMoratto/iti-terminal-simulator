//
//  HomeViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 04/10/21.
//

import Foundation

struct HomeViewController {
    
    // MARK: - Attributes
    
    private let view: HomeView
    private let userViewComponent: UserViewComponentProtocol
    private let userOperationComponent: UserOperationComponentProtocol
    private let loginComponent: LoginComponentProtocol
    
    // MARK: - Initializers (Constructors)
    
    init(view: HomeView, userViewComponent: UserViewComponentProtocol, userOperationComponent: UserOperationComponentProtocol,
         loginComponent: LoginComponentProtocol) {
        self.view = view
        self.userViewComponent = userViewComponent
        self.userOperationComponent = userOperationComponent
        self.loginComponent = loginComponent
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
                routeTo.pixMenu()
            case 2:
                routeTo.paymentAndTransfer()
            case 3:
                routeTo.displayAccount()
            case 4:
                routeTo.profileMenu()
            case 0:
                loginComponent.logout()
                scenes = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
