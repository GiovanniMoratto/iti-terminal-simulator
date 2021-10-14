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
                if !routeTo().bank().checkDocumentNumberPixKeyIsEmpty(token) {
                    scene.pixCpfAlreadyExists()
                } else {
                    let documentNumber = routeTo().bank().getDocumentNumberPixKey()
                    routeTo().bank().registerPixKey(token, .CPF, documentNumber)
                    scene.successfullyMessage()
                }
            case 2:
                if !routeTo().bank().checkEmailPixKeyIsEmpty(token){
                    scene.pixEmailAlreadyExists()
                } else {
                    let email = routeTo().bank().getEmailPixKey()
                    routeTo().bank().registerPixKey(token, .email, email)
                    scene.successfullyMessage()
                }
            case 3:
                if !routeTo().bank().checkPhonePixKeyIsEmpty(token){
                    scene.pixPhoneAlreadyExists()
                } else {
                    let phone = routeTo().bank().getPhonePixKey()
                    routeTo().bank().registerPixKey(token, .phoneNumber, phone)
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
