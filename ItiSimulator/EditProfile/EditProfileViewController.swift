//
//  EditProfileViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

class EditProfileViewController {
    
    // MARK: - Attributes
    
    let scene = EditProfileView()
    let valid = FieldsValidations()
    
    // MARK: - Methods
    
    func process(user: UserModel?) {
        guard let userUnwrapped = user else { return }
        
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMenu()
            
            guard let inputString = scene.getInput() else { return }
            let input = Int(inputString)
            
            switch input {
            case 0:
                loop = false
            case 1:
                //                Nome
                loop = false
                scene.showUsernameField(firstName: userUnwrapped.firstName, lastName: userUnwrapped.lastName)
                let firstNameField = "'primeiro nome'"
                let lastNameField = "'sobrenome'"
                
                guard let firstName = getFirstName(field: firstNameField) else { return }
                guard let lastName = getLastName(field: lastNameField) else { return }
                
                guard let firstNameDb = db.update(user: userUnwrapped, attribute: "firstName", value: firstName) else { return }
                guard let lastNameDb = db.update(user: userUnwrapped, attribute: "lastName", value: lastName) else { return }
                
                if !firstNameDb, !lastNameDb {
                    print("Desculpe, estamos com problemas")
                }
                
                scene.showSuccessfullyUpdate(field: firstNameField)
                scene.showSuccessfullyUpdate(field: lastNameField)
            case 2:
                //                Endereço
                loop = false
                scene.showAddressField(address: userUnwrapped.address)
                let addressField = "'endereço'"
                
                guard let address = getAddress(field: addressField) else { return }
                
                guard let database = db.update(user: userUnwrapped, attribute: "address", value: address) else { return }
                
                if !database {
                    print("Desculpe, estamos com problemas")
                }
                
                scene.showSuccessfullyUpdate(field: addressField)
            case 3:
                //                Cidade
                loop = false
                scene.showCityField(city: userUnwrapped.city)
                let cityField = "'cidade'"
                
                guard let city = getCity(field: cityField) else { return }
                
                guard let database = db.update(user: userUnwrapped, attribute: "city", value: city) else { return }
                
                if !database {
                    print("Desculpe, estamos com problemas")
                }
                
                scene.showSuccessfullyUpdate(field: cityField)
            case 4:
                //                Estado
                loop = false
                scene.showStateField(state: userUnwrapped.state)
                let stateField = "'estado'"
                
                guard let state = getState(field: stateField) else { return }
                
                guard let database = db.update(user: userUnwrapped, attribute: "state", value: state) else { return }
                
                if !database {
                    print("Desculpe, estamos com problemas")
                }
                
                scene.showSuccessfullyUpdate(field: stateField)
            case 5:
                //                Telefone
                loop = false
                scene.showPhoneNumberField(phoneNumber: userUnwrapped.phoneNumber)
                let phoneNumberField = "'telefone'"
                
                guard let phoneNumber = getPhoneNumber(field: phoneNumberField) else { return }
                
                guard let database = db.update(user: userUnwrapped, attribute: "phoneNumber", value: phoneNumber) else { return }
                
                if !database {
                    print("Desculpe, estamos com problemas")
                }
                
                scene.showSuccessfullyUpdate(field: phoneNumberField)
            case 6:
                //      email
                loop = false
                scene.showEmailField(email: userUnwrapped.email)
                let emailField = "'e-mail'"
                
                guard let email = getEmail(field: emailField) else { return }
                
                guard let database = db.update(user: userUnwrapped, attribute: "email", value: email) else { return }
                
                if !database {
                    print("Desculpe, estamos com problemas")
                }
                
                scene.showSuccessfullyUpdate(field: emailField)
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
    func getFirstName(field: String?) -> String? {
        scene.showFirstNameForm()
        guard let firstName = scene.getInput(),
              valid.notEmpty(field: field, value: firstName) ?? false,
              valid.minLength(field: field, value: firstName, length: 3) ?? false,
              valid.maxLength(field: field, value: firstName, length: 12) ?? false
        else { return EditProfileViewController().getFirstName(field: field)}
        return firstName
    }
    
    func getLastName(field: String?) -> String? {
        scene.showLastNameForm()
        guard let lastName = scene.getInput(),
              valid.notEmpty(field: field, value: lastName) ?? false,
              valid.minLength(field: field, value: lastName, length: 3) ?? false,
              valid.maxLength(field: field, value: lastName, length: 12) ?? false
        else { return EditProfileViewController().getLastName(field: field)}
        return lastName
    }
    
    func getAddress(field: String?) -> String? {
        scene.showAddressForm()
        guard let address = scene.getInput(),
              valid.notEmpty(field: field, value: address) ?? false,
              valid.minLength(field: field, value: address, length: 3) ?? false,
              valid.maxLength(field: field, value: address, length: 12) ?? false
        else { return EditProfileViewController().getAddress(field: field)}
        return address
    }
    
    func getCity(field: String?) -> String? {
        scene.showCityForm()
        guard let city = scene.getInput(),
              valid.notEmpty(field: field, value: city) ?? false,
              valid.minLength(field: field, value: city, length: 3) ?? false,
              valid.maxLength(field: field, value: city, length: 12) ?? false
        else { return EditProfileViewController().getCity(field: field)}
        return city
    }
    
    func getState(field: String?) -> String? {
        scene.showStateForm()
        guard let state = scene.getInput(),
              valid.notEmpty(field: field, value: state) ?? false,
              valid.minLength(field: field, value: state, length: 3) ?? false,
              valid.maxLength(field: field, value: state, length: 12) ?? false
        else { return EditProfileViewController().getState(field: field)}
        return state
    }
    
    func getPhoneNumber(field: String?) -> String? {
        scene.showPhoneNumberForm()
        guard let phoneNumber = scene.getInput(),
              valid.notEmpty(field: field, value: phoneNumber) ?? false,
              valid.minLength(field: field, value: phoneNumber, length: 3) ?? false,
              valid.maxLength(field: field, value: phoneNumber, length: 12) ?? false
        else { return EditProfileViewController().getPhoneNumber(field: field)}
        return phoneNumber
    }
    
    func getEmail(field: String?) -> String? {
        scene.showEmailForm()
        guard let email = scene.getInput(),
              valid.notEmpty(field: field, value: email) ?? false,
              valid.minLength(field: field, value: email, length: 3) ?? false,
              valid.maxLength(field: field, value: email, length: 12) ?? false
        else { return EditProfileViewController().getEmail(field: field)}
        return email
    }
    
    
    
}
