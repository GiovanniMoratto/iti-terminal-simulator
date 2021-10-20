//
//  SystemViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 15/10/21.
//

import Foundation

class SystemViewController: SystemView {
    
    // MARK: - Attributes
    
    lazy var userViewComponent = UserViewComponent()
    lazy var bankViewComponent = BankViewComponent()
    lazy var userOperationComponent = UserOperationComponent(
        view: userViewComponent
    )
    lazy var bankOperationComponent = BankOperationComponent(
        userViewComponent: userViewComponent,
        bankViewComponent: bankViewComponent
    )
    lazy var loginComponent = LoginComponent(view: LoginView(), userViewComponent: userViewComponent)
    
    // MARK: - Methods
    
    func process() {
        var scenes = true
        
        while scenes {
            showTitle()
            showMenu()
            
            switch userViewComponent.getNavigation() {
            case 1:
                routeTo().welcome()
            case 2:
                routeTo().database()
            case 0:
                showExit()
                scenes = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
    func routeTo() -> RoutesComponent {
       
        return RoutesComponent(
            userViewComponent: userViewComponent,
            bankViewComponent: bankViewComponent,
            userOperationComponent: userOperationComponent,
            bankOperationComponent: bankOperationComponent,
            loginComponent: loginComponent)
    }
    
    private func initialData() {
        DataTest().initialData()
    }
    
    func start() {
        initialData()
        routeTo().system()
    }
    
}
