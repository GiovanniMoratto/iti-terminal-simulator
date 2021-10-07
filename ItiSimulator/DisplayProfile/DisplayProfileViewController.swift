//
//  ShowProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

class DisplayProfileViewController {
    
    // MARK: - Methods
    
    func process(user: UserModel?) {
        guard let userUnwrapped = user else { return }
        
        view.displayProfile().showTitle()
        
        view.displayProfile().showUsernameField(firstName: userUnwrapped.firstName, lastName: userUnwrapped.lastName)
        view.displayProfile().showDocumentNumberField(documentNumber: userUnwrapped.documentNumber)
        view.displayProfile().showAddressField(address: userUnwrapped.address)
        view.displayProfile().showCityField(city: userUnwrapped.city)
        view.displayProfile().showStateField(state: userUnwrapped.state)
        view.displayProfile().showPhoneNumberField(phoneNumber: userUnwrapped.phoneNumber)
        view.displayProfile().showEmailField(email: userUnwrapped.email)
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
