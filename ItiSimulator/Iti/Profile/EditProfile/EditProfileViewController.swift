//
//  EditProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

class EditProfileViewController {
    
    // MARK: - Methods
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
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
                guard let firstName = routeTo().controller.form().getProfileInfo(token).firstName else { return }
                guard let lastName = routeTo().controller.form().getProfileInfo(token).lastName else { return }
                
                // Imprimi
                routeTo().view.editProfile().showUsernameField(firstName, lastName)
                
                // Pega novos valores
                guard let newFirstName = routeTo().controller.form().getFirstName() else { return }
                guard let newLastName = routeTo().controller.form().getLastName() else { return }
                
                // Salva no banco
                guard let firstNameUpdated = db.updateUser(key: token, where: "firstName", of: newFirstName) else { return }
                guard let lastNameUpdated = db.updateUser(key: token, where: "lastName", of: newLastName) else { return }
                
                if !firstNameUpdated, !lastNameUpdated {
                    print("Desculpe, estamos com problemas")
                }
                
                // Imprimi
                routeTo().view.editProfile().showSuccessfullyUpdate()
                
                loop = false
            case 2:
                // Endereço

                guard let address = routeTo().controller.form().getProfileInfo(token).address else { return }
                
                routeTo().view.editProfile().showAddressField(address)
                
                guard let newAddress = routeTo().controller.form().getAddress() else { return }
                
                guard let addressUpdated = db.updateUser(key: token, where: "address", of: newAddress) else { return }
                
                if !addressUpdated {
                    print("Desculpe, estamos com problemas")
                }
                
                routeTo().view.editProfile().showSuccessfullyUpdate()
                
                loop = false
            case 3:
                // Cidade
                
                guard let city = routeTo().controller.form().getProfileInfo(token).city else { return }
                
                routeTo().view.editProfile().showCityField(city)
                
                guard let newCity = routeTo().controller.form().getCity() else { return }
                
                guard let cityUpdated = db.updateUser(key: token, where: "city", of: newCity) else { return }
                
                if !cityUpdated {
                    print("Desculpe, estamos com problemas")
                }
                
                routeTo().view.editProfile().showSuccessfullyUpdate()
                
                loop = false
            case 4:
                // Estado
                
                guard let state = routeTo().controller.form().getProfileInfo(token).state else { return }
                
                routeTo().view.editProfile().showStateField(state)
                
                guard let newState = routeTo().controller.form().getState() else { return }
                
                guard let stateUpdated = db.updateUser(key: token, where: "state", of: newState) else { return }
                
                if !stateUpdated {
                    print("Desculpe, estamos com problemas")
                }
                
                routeTo().view.editProfile().showSuccessfullyUpdate()
                
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
}
