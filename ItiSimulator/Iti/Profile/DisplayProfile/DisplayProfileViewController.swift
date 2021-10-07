//
//  ShowProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

class DisplayProfileViewController {
    
    // MARK: - Methods
    
    func process(token: String?) {
        guard let tokenUnwrapped = token else { return }
        
        routeTo().view.displayProfile().showTitle()
        
        guard let firstName = routeTo().controller.form().getProfileInfo(token: tokenUnwrapped).firstName else { return }
        guard let lastName = routeTo().controller.form().getProfileInfo(token: tokenUnwrapped).lastName else { return }
        
        routeTo().view.displayProfile().showUsernameField(firstName: firstName, lastName: lastName)
        
        guard let documentNumber = routeTo().controller.form().getProfileInfo(token: tokenUnwrapped).documentNumber else { return }
        routeTo().view.displayProfile().showDocumentNumberField(documentNumber: documentNumber)
        
        guard let address = routeTo().controller.form().getProfileInfo(token: tokenUnwrapped).address else { return }
        routeTo().view.displayProfile().showAddressField(address: address)
        
        guard let city = routeTo().controller.form().getProfileInfo(token: tokenUnwrapped).city else { return }
        routeTo().view.displayProfile().showCityField(city: city)
        
        guard let state = routeTo().controller.form().getProfileInfo(token: tokenUnwrapped).state else { return }
        routeTo().view.displayProfile().showStateField(state: state)
        
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
