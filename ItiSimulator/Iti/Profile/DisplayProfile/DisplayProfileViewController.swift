//
//  ShowProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

class DisplayProfileViewController {
    
    // MARK: - Methods
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        routeTo().view.displayProfile().showTitle()
        
        guard let firstName = routeTo().controller.form().getProfileInfo(token).firstName else { return }
        guard let lastName = routeTo().controller.form().getProfileInfo(token).lastName else { return }
        
        routeTo().view.displayProfile().showUsernameField(firstName, lastName)
        
        guard let documentNumber = routeTo().controller.form().getProfileInfo(token).documentNumber else { return }
        routeTo().view.displayProfile().showDocumentNumberField(documentNumber)
        
        guard let address = routeTo().controller.form().getProfileInfo(token).address else { return }
        routeTo().view.displayProfile().showAddressField(address)
        
        guard let city = routeTo().controller.form().getProfileInfo(token).city else { return }
        routeTo().view.displayProfile().showCityField(city)
        
        guard let state = routeTo().controller.form().getProfileInfo(token).state else { return }
        routeTo().view.displayProfile().showStateField(state)
        
        routeTo().view.displayProfile().showExit()
        
        var loop = true
        
        while loop {
            
            guard let input = routeTo().view.label().getInput() else { return }
            let option = Int(input)
            
            switch option {
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
