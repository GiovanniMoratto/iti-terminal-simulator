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
        
        router().view.displayProfile().showTitle()
        
        guard let firstName = router().controller.form().getProfileInfo(token: tokenUnwrapped).firstName else { return }
        guard let lastName = router().controller.form().getProfileInfo(token: tokenUnwrapped).lastName else { return }
        
        router().view.displayProfile().showUsernameField(firstName: firstName, lastName: lastName)
        
        guard let documentNumber = router().controller.form().getProfileInfo(token: tokenUnwrapped).documentNumber else { return }
        router().view.displayProfile().showDocumentNumberField(documentNumber: documentNumber)
        
        guard let address = router().controller.form().getProfileInfo(token: tokenUnwrapped).address else { return }
        router().view.displayProfile().showAddressField(address: address)
        
        guard let city = router().controller.form().getProfileInfo(token: tokenUnwrapped).city else { return }
        router().view.displayProfile().showCityField(city: city)
        
        guard let state = router().controller.form().getProfileInfo(token: tokenUnwrapped).state else { return }
        router().view.displayProfile().showStateField(state: state)
        
        router().view.displayProfile().showExit()
        
        var loop = true
        
        while loop {
            
            guard let input = router().view.label().getInput() else { return }
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
