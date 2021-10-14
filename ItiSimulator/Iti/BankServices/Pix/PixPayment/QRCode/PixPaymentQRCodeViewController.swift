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
        let op = BankViewController()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMenu()
            
            switch view.getNavigation() {
            case 1:
                if op.getQRCodeByDocumentNumber(token).condition {
                    let pixKey = op.getQRCodeByDocumentNumber(token).pixKey
                    let value = op.getValueForPayment()
                    let code = op.generateQRCode(pixKey, value)
                    
                    scene.showSuccessCreate()
                    scene.showCode(code)
                } else {
                    scene.errorQRCodeMessage()
                }
                
            case 2:
                if op.getQRCodeByEmail(token).condition {
                    let pixKey = op.getQRCodeByEmail(token).pixKey
                    let value = op.getValueForPayment()
                    let code = op.generateQRCode(pixKey, value)
                    
                    scene.showSuccessCreate()
                    scene.showCode(code)
                } else {
                    scene.errorQRCodeMessage()
                }
            case 3:
                if op.getQRCodeByPhone(token).condition {
                    let pixKey = op.getQRCodeByPhone(token).pixKey
                    let value = op.getValueForPayment()
                    let code = op.generateQRCode(pixKey, value)
                    
                    scene.showSuccessCreate()
                    scene.showCode(code)
                } else {
                    scene.errorQRCodeMessage()
                }
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
