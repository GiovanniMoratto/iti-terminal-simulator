//
//  WelcomeViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 01/10/21.
//

import Foundation

struct WelcomeViewController {
    
    // MARK: - Attributes
    
    private let view: WelcomeView
    private let userViewComponent: UserViewComponentProtocol
    
    
    // MARK: - Initializers (Constructors)
    
    init(view: WelcomeView, userViewComponent: UserViewComponentProtocol) {
        self.view = view
        self.userViewComponent = userViewComponent
    }
    
    // MARK: - Methods
    
    func process() {
        var scenes = true
        
        while scenes {
            view.showTitle()
            view.showMenu()
            
            switch userViewComponent.getNavigation() {
            case 1:
                routeTo.login()
            case 2:
                routeTo.createProfile()
            case 0:
                view.showExit()
                scenes = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
