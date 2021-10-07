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
            view.editProfile().showTitle()
            view.editProfile().showMenu()
            
            guard let inputString = view.label().getInput() else { return }
            let input = Int(inputString)
            
            switch input {
            case 0:
                loop = false
            case 1:
                // Nome
                loop = false
                
                // Recebe valores atuais
                guard let firstName = controller.form().getProfileInfo(token: tokenUnwrapped).firstName else { return }
                guard let lastName = controller.form().getProfileInfo(token: tokenUnwrapped).lastName else { return }
                
                // Imprimi
                view.editProfile().showUsernameField(firstName: firstName, lastName: lastName)
                
                // Pega novos valores
                guard let newFirstName = controller.form().getFirstName() else { return }
                guard let newLastName = controller.form().getLastName() else { return }
                
                // Salva no banco
                guard let firstNameUpdated = db.update(token: tokenUnwrapped, attribute: "firstName", value: newFirstName) else { return }
                guard let lastNameUpdated = db.update(token: tokenUnwrapped, attribute: "lastName", value: newLastName) else { return }
                
                if !firstNameUpdated, !lastNameUpdated {
                    print("Desculpe, estamos com problemas")
                }
                
                // Imprimi
                view.editProfile().showSuccessfullyUpdate(field: "'Nome'")
            case 2:
                // Endereço
                loop = false
                
                guard let address = controller.form().getProfileInfo(token: tokenUnwrapped).address else { return }
                
                view.editProfile().showAddressField(address: address)
                
                guard let newAddress = controller.form().getAddress() else { return }
                
                guard let addressUpdated = db.update(token: tokenUnwrapped, attribute: "address", value: newAddress) else { return }
                
                if !addressUpdated {
                    print("Desculpe, estamos com problemas")
                }
                
                view.editProfile().showSuccessfullyUpdate(field: "Endereço")
            case 3:
                // Cidade
                loop = false
                
                guard let city = controller.form().getProfileInfo(token: tokenUnwrapped).city else { return }
                
                view.editProfile().showCityField(city: city)
                
                guard let newCity = controller.form().getCity() else { return }
                
                guard let cityUpdated = db.update(token: tokenUnwrapped, attribute: "city", value: newCity) else { return }
                
                if !cityUpdated {
                    print("Desculpe, estamos com problemas")
                }
                
                view.editProfile().showSuccessfullyUpdate(field: "Cidade")
            case 4:
                // Estado
                loop = false
                
                guard let state = controller.form().getProfileInfo(token: tokenUnwrapped).state else { return }
                
                view.editProfile().showStateField(state: state)
                
                guard let newState = controller.form().getState() else { return }
                
                guard let stateUpdated = db.update(token: tokenUnwrapped, attribute: "state", value: newState) else { return }
                
                if !stateUpdated {
                    print("Desculpe, estamos com problemas")
                }
                
                view.editProfile().showSuccessfullyUpdate(field: "Estado")
            case 5:
                // Telefone
                loop = false
            case 6:
                // Email
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
}
