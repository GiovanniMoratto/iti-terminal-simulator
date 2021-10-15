//
//  PixTransferViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 13/10/21.
//

import Foundation

struct PixTransferViewController {
    
    // MARK: - Methods
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        let scene = PixTransferView()
        let view = UserView()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMenu()
            
            switch view.getNavigation() {
            case 1:
                routeTo().bank().transferPixKeyOfDocumentNumber(token)
            case 2:
                routeTo().bank().transferPixKeyOfEmail(token)
            case 3:
                routeTo().bank().transferPixKeyOfPhoneNumber(token)
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
}
