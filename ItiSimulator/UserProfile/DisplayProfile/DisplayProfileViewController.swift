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
        
        view.displayProfile().showTitle()
        
        guard let firstName = controller.form().getProfileInfo(token: tokenUnwrapped).firstName else { return }
        guard let lastName = controller.form().getProfileInfo(token: tokenUnwrapped).lastName else { return }
        
        view.displayProfile().showUsernameField(firstName: firstName, lastName: lastName)
        
        guard let documentNumber = controller.form().getProfileInfo(token: tokenUnwrapped).documentNumber else { return }
        view.displayProfile().showDocumentNumberField(documentNumber: documentNumber)
        
        guard let address = controller.form().getProfileInfo(token: tokenUnwrapped).address else { return }
        view.displayProfile().showAddressField(address: address)
        
        guard let city = controller.form().getProfileInfo(token: tokenUnwrapped).city else { return }
        view.displayProfile().showCityField(city: city)
        
        guard let state = controller.form().getProfileInfo(token: tokenUnwrapped).state else { return }
        view.displayProfile().showStateField(state: state)
        
        view.displayProfile().showExit()
        
        var loop = true
        
        while loop {
            guard let input = view.label().getInput() else { return }
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
