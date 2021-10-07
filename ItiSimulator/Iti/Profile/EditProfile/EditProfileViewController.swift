//
//  EditProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

class EditProfileViewController {
    
    // MARK: - Methods
    
    func process(token: String?) {
        guard let tokenUnwrapped = token else { return }
        
        var loop = true
        
        while loop {
            router().view.editProfile().showTitle()
            router().view.editProfile().showMenu()
            
            guard let inputString = router().view.label().getInput() else { return }
            let input = Int(inputString)
            
            switch input {
            case 0:
                loop = false
            case 1:
                // Nome
                
                // Recebe valores atuais
                guard let firstName = router().controller.form().getProfileInfo(token: tokenUnwrapped).firstName else { return }
                guard let lastName = router().controller.form().getProfileInfo(token: tokenUnwrapped).lastName else { return }
                
                // Imprimi
                router().view.editProfile().showUsernameField(firstName: firstName, lastName: lastName)
                
                // Pega novos valores
                guard let newFirstName = router().controller.form().getFirstName() else { return }
                guard let newLastName = router().controller.form().getLastName() else { return }
                
                // Salva no banco
                guard let firstNameUpdated = db.update(token: tokenUnwrapped, attribute: "firstName", value: newFirstName) else { return }
                guard let lastNameUpdated = db.update(token: tokenUnwrapped, attribute: "lastName", value: newLastName) else { return }
                
                if !firstNameUpdated, !lastNameUpdated {
                    print("Desculpe, estamos com problemas")
                }
                
                // Imprimi
                router().view.editProfile().showSuccessfullyUpdate(field: "'Nome'")
                
                loop = false
            case 2:
                // Endereço

                guard let address = router().controller.form().getProfileInfo(token: tokenUnwrapped).address else { return }
                
                router().view.editProfile().showAddressField(address: address)
                
                guard let newAddress = router().controller.form().getAddress() else { return }
                
                guard let addressUpdated = db.update(token: tokenUnwrapped, attribute: "address", value: newAddress) else { return }
                
                if !addressUpdated {
                    print("Desculpe, estamos com problemas")
                }
                
                router().view.editProfile().showSuccessfullyUpdate(field: "Endereço")
                
                loop = false
            case 3:
                // Cidade
                
                guard let city = router().controller.form().getProfileInfo(token: tokenUnwrapped).city else { return }
                
                router().view.editProfile().showCityField(city: city)
                
                guard let newCity = router().controller.form().getCity() else { return }
                
                guard let cityUpdated = db.update(token: tokenUnwrapped, attribute: "city", value: newCity) else { return }
                
                if !cityUpdated {
                    print("Desculpe, estamos com problemas")
                }
                
                router().view.editProfile().showSuccessfullyUpdate(field: "Cidade")
                
                loop = false
            case 4:
                // Estado
                
                guard let state = router().controller.form().getProfileInfo(token: tokenUnwrapped).state else { return }
                
                router().view.editProfile().showStateField(state: state)
                
                guard let newState = router().controller.form().getState() else { return }
                
                guard let stateUpdated = db.update(token: tokenUnwrapped, attribute: "state", value: newState) else { return }
                
                if !stateUpdated {
                    print("Desculpe, estamos com problemas")
                }
                
                router().view.editProfile().showSuccessfullyUpdate(field: "Estado")
                
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
}
