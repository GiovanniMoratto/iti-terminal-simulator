//
//  PixRegisterViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 13/10/21.
//

import Foundation

struct PixKeyRegisterViewController {
    
    // MARK: - Methods
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        let scene = PixKeyRegisterView()
        let view = UserView()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMenu()
            
            switch view.getNavigation() {
            case 1:
                routeTo().bank().registerPixKeyOfDocumentNumber(token)
            case 2:
                routeTo().bank().registerPixKeyOfEmail(token)
            case 3:
                routeTo().bank().registerPixKeyOfPhoneNumber(token)
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
            
        }
    }
}
