//
//  EditProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

class EditProfileViewController {
    
    // MARK: - Methods
    
    func process(user: UserModel?) {
        guard let userUnwrapped = user else { return }
        
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
                view.editProfile().showUsernameField(firstName: userUnwrapped.firstName, lastName: userUnwrapped.lastName)
                
                guard let firstName = controller.form().getFirstName() else { return }
                guard let lastName = controller.form().getLastName() else { return }
                guard let firstNameDb = db.update(user: userUnwrapped, attribute: "firstName", value: firstName) else { return }
                guard let lastNameDb = db.update(user: userUnwrapped, attribute: "lastName", value: lastName) else { return }
                
                if !firstNameDb, !lastNameDb {
                    print("Desculpe, estamos com problemas")
                }
                
                view.editProfile().showSuccessfullyUpdate(field: "'Nome'")
            case 2:
                // Endereço
                loop = false
                
                view.editProfile().showAddressField(address: userUnwrapped.address)
                
                guard let address = controller.form().getAddress() else { return }
                guard let database = db.update(user: userUnwrapped, attribute: "address", value: address) else { return }
                
                if !database {
                    print("Desculpe, estamos com problemas")
                }
                
                view.editProfile().showSuccessfullyUpdate(field: "Endereço")
            case 3:
                // Cidade
                loop = false
                
                view.editProfile().showCityField(city: userUnwrapped.city)
                
                guard let city = controller.form().getCity() else { return }
                guard let database = db.update(user: userUnwrapped, attribute: "city", value: city) else { return }
                
                if !database {
                    print("Desculpe, estamos com problemas")
                }
                
                view.editProfile().showSuccessfullyUpdate(field: "Cidade")
            case 4:
                // Estado
                loop = false
                
                view.editProfile().showStateField(state: userUnwrapped.state)
                
                guard let state = controller.form().getState() else { return }
                guard let database = db.update(user: userUnwrapped, attribute: "state", value: state) else { return }
                
                if !database {
                    print("Desculpe, estamos com problemas")
                }
                
                view.editProfile().showSuccessfullyUpdate(field: "Estado")
            case 5:
                // Telefone
                loop = false
                
                view.editProfile().showPhoneNumberField(phoneNumber: userUnwrapped.phoneNumber)
                
                guard let phoneNumber = controller.form().getPhoneNumber() else { return }
                guard let database = db.update(user: userUnwrapped, attribute: "phoneNumber", value: phoneNumber) else { return }
                
                if !database {
                    print("Desculpe, estamos com problemas")
                }
                
                view.editProfile().showSuccessfullyUpdate(field: "Telefone")
            case 6:
                // Email
                loop = false
                
                view.editProfile().showEmailField(email: userUnwrapped.email)
                
                guard let email = controller.form().getEmail() else { return }
                guard let database = db.update(user: userUnwrapped, attribute: "email", value: email) else { return }
                
                if !database {
                    print("Desculpe, estamos com problemas")
                }
                
                view.editProfile().showSuccessfullyUpdate(field: "E-mail")
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
}
