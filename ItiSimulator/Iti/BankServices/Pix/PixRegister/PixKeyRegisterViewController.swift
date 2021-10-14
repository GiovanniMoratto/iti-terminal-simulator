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
        let op = BankViewController()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMenu()
            
            switch view.getNavigation() {
            case 1:
                if !op.checkDocumentNumberPixKeyIsEmpty(token) {
                    scene.pixCpfAlreadyExists()
                } else {
                    let documentNumber = op.getDocumentNumberPixKeyToRegister()
                    op.registerPixKey(token, .CPF, documentNumber)
                    scene.successfullyMessage()
                }
            case 2:
                if !op.checkEmailPixKeyIsEmpty(token){
                    scene.pixEmailAlreadyExists()
                } else {
                    let email = op.getEmailPixKeyToRegister()
                    op.registerPixKey(token, .email, email)
                    scene.successfullyMessage()
                }
            case 3:
                if !op.checkPhonePixKeyIsEmpty(token){
                    scene.pixPhoneAlreadyExists()
                } else {
                    let phone = op.getPhonePixKeyToRegister()
                    op.registerPixKey(token, .phoneNumber, phone)
                    scene.successfullyMessage()
                }
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
            
        }
    }
}
