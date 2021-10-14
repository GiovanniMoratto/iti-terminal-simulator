//
//  PixKeyDeleteViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 13/10/21.
//

import Foundation

struct PixKeyDeleteViewController {
    
    // MARK: - Methods
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        let scene = PixKeyDeleteView()
        let view = UserView()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMenu()
            
            switch view.getNavigation() {
            case 1:
                if !routeTo().bank().checkDocumentNumberPixKeyIsEmpty(token) {
                    var option = true
                    while option {
                        scene.showMessage()
                        switch view.getNavigation() {
                        case 1:
                            routeTo().bank().deleteDocumentNumberPixKey(token)
                            scene.showSuccessfullyDeleted()
                            option = false
                        case 0:
                            option = false
                        default:
                            print("Por favor, escolha uma operação")
                        }
                    }
                } else {
                    scene.showNotExistMessage("CPF")
                }
            case 2:
                if !routeTo().bank().checkEmailPixKeyIsEmpty(token) {
                    var option = true
                    while option {
                        scene.showMessage()
                        switch view.getNavigation() {
                        case 1:
                            routeTo().bank().deleteEmailPixKey(token)
                            scene.showSuccessfullyDeleted()
                            option = false
                        case 0:
                            option = false
                        default:
                            print("Por favor, escolha uma operação")
                        }
                    }
                } else {
                    scene.showNotExistMessage("E-mail")
                }
            case 3:
                if !routeTo().bank().checkPhonePixKeyIsEmpty(token) {
                    var option = true
                    while option {
                        scene.showMessage()
                        switch view.getNavigation() {
                        case 1:
                            routeTo().bank().deletePhonePixKey(token)
                            scene.showSuccessfullyDeleted()
                            option = false
                        case 0:
                            option = false
                        default:
                            print("Por favor, escolha uma operação")
                        }
                    }
                } else {
                    scene.showNotExistMessage("Telefone")
                }
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
