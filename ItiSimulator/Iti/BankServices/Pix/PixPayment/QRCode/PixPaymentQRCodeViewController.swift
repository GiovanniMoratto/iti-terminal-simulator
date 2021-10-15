//
//  PixPaymentQRCodeViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 14/10/21.
//

import Foundation

struct PixPaymentQRCodeViewController {
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        let scene = PixPaymentQRCodeView()
        let view = UserView()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMenu()
            
            switch view.getNavigation() {
            case 1:
                routeTo().bank().QRCodePixKeyOfDocumentNumber(token)
            case 2:
                routeTo().bank().QRCodePixKeyOfEmail(token)
            case 3:
                routeTo().bank().QRCodePixKeyOfPhoneNumber(token)
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
