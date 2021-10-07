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
            routeTo().view.editProfile().showTitle()
            routeTo().view.editProfile().showMenu()
            
            guard let inputString = routeTo().view.label().getInput() else { return }
            let input = Int(inputString)
            
            switch input {
            case 0:
                loop = false
            case 1:
                // Nome
                
                // Recebe valores atuais
                guard let firstName = routeTo().controller.form().getProfileInfo(token: tokenUnwrapped).firstName else { return }
                guard let lastName = routeTo().controller.form().getProfileInfo(token: tokenUnwrapped).lastName else { return }
                
                // Imprimi
                routeTo().view.editProfile().showUsernameField(firstName: firstName, lastName: lastName)
                
                // Pega novos valores
                guard let newFirstName = routeTo().controller.form().getFirstName() else { return }
                guard let newLastName = routeTo().controller.form().getLastName() else { return }
                
                // Salva no banco
                guard let firstNameUpdated = db.update(token: tokenUnwrapped, attribute: "firstName", value: newFirstName) else { return }
                guard let lastNameUpdated = db.update(token: tokenUnwrapped, attribute: "lastName", value: newLastName) else { return }
                
                if !firstNameUpdated, !lastNameUpdated {
                    print("Desculpe, estamos com problemas")
                }
                
                // Imprimi
                routeTo().view.editProfile().showSuccessfullyUpdate(field: "'Nome'")
                
                loop = false
            case 2:
                // Endereço

                guard let address = routeTo().controller.form().getProfileInfo(token: tokenUnwrapped).address else { return }
                
                routeTo().view.editProfile().showAddressField(address: address)
                
                guard let newAddress = routeTo().controller.form().getAddress() else { return }
                
                guard let addressUpdated = db.update(token: tokenUnwrapped, attribute: "address", value: newAddress) else { return }
                
                if !addressUpdated {
                    print("Desculpe, estamos com problemas")
                }
                
                routeTo().view.editProfile().showSuccessfullyUpdate(field: "Endereço")
                
                loop = false
            case 3:
                // Cidade
                
                guard let city = routeTo().controller.form().getProfileInfo(token: tokenUnwrapped).city else { return }
                
                routeTo().view.editProfile().showCityField(city: city)
                
                guard let newCity = routeTo().controller.form().getCity() else { return }
                
                guard let cityUpdated = db.update(token: tokenUnwrapped, attribute: "city", value: newCity) else { return }
                
                if !cityUpdated {
                    print("Desculpe, estamos com problemas")
                }
                
                routeTo().view.editProfile().showSuccessfullyUpdate(field: "Cidade")
                
                loop = false
            case 4:
                // Estado
                
                guard let state = routeTo().controller.form().getProfileInfo(token: tokenUnwrapped).state else { return }
                
                routeTo().view.editProfile().showStateField(state: state)
                
                guard let newState = routeTo().controller.form().getState() else { return }
                
                guard let stateUpdated = db.update(token: tokenUnwrapped, attribute: "state", value: newState) else { return }
                
                if !stateUpdated {
                    print("Desculpe, estamos com problemas")
                }
                
                routeTo().view.editProfile().showSuccessfullyUpdate(field: "Estado")
                
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
}
