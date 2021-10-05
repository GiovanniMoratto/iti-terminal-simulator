//
//  ShowProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

class ShowProfileViewController {
    
    // MARK: - Attributes
    
    let scene = ShowProfileView()
    
    // MARK: - Methods
    
    func process(user: UserModel?) {
        guard let userUnwrapped = user else { return }
        
        scene.showTitle()
        
        scene.showUsernameField(firstName: userUnwrapped.firstName, lastName: userUnwrapped.lastName)
        scene.showDocumentField(document: userUnwrapped.document)
        scene.showAddressField(address: userUnwrapped.address)
        scene.showCityField(city: userUnwrapped.city)
        scene.showStateField(state: userUnwrapped.state)
        scene.showPhoneNumberField(phoneNumber: userUnwrapped.phoneNumber)
        scene.showEmailField(email: userUnwrapped.email)
        scene.showExit()
        
        var loop = true
        while loop {
            guard let inputString = scene.getInput() else { return }
            let input = Int(inputString)
            
            switch input {
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
