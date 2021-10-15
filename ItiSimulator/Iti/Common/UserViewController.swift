//
//  UserOperation.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

struct UserViewController: UserViewControllerProtocol {

    /*
     Métodos responsáveis por chamada de views, recebimento de input, validação e retornos.
     */
    
    // MARK: - Attributes
    
    let view: UserViewProtocol = UserView()
    
    // MARK: - Methods
    
    /* Create User */
    
    func getFirstName() -> String {
        view.firstNameRequest()
        let text = "'primeiro nome'"
        
        guard let firstName = view.getInput(),
                firstName.notEmpty(text), firstName.minLength(text, 3), firstName.maxLength(text, 12)
        else { return getFirstName() }
        
        return firstName
    }
    
    func getLastName() -> String {
        view.lastNameRequest()
        let text = "'sobrenome'"
        
        guard let lastName = view.getInput(),
              lastName.notEmpty(text), lastName.minLength(text, 3), lastName.maxLength(text, 12)
        else { return getLastName() }
        
        return lastName
    }
    
    func getDocumentNumber() -> String {
        view.documentNumberRequest()
        
        guard let documentNumber = view.getInput(),
              documentNumber.notEmpty("'CPF'"), documentNumber.isValidCpf(), documentNumber.unique(.documentNumber)
        else { return getDocumentNumber() }
        
        return documentNumber
    }
    
    func getPassword() -> String {
        view.passwordRequest()
        
        guard let password = view.getInput(),
              password.notEmpty("'senha'"), password.isValidPassword
        else { return getPassword() }
        
        return password
    }

    /* Overview */
    
    func overview(_ token: String) {
        guard let user = getUser(token) else { return }

        view.overview(user.firstName, user.lastName, user.bankAccount.balance)
    }
    
    /* Display Methods */
    
    func profileInfo(_ token: String) {
        guard let user = getUser(token) else { return }
        
        view.username(user.firstName, user.lastName)
        view.documentNumber(user.documentNumber)
        view.address(user.address.address)
        view.city(user.address.city)
        view.state(user.address.state)
    }
    
    /* Update Profile */
    
    func usernameUpdated(_ token: String) {
        guard let user = getUser(token) else { return }
        let view = EditProfileView()

        view.currentUsername(user.firstName, user.lastName)
        
        user.firstName = getFirstName()
        user.lastName = getLastName()
        
        db.save(user)
        view.successfullyUpdateMessage()
    }
    
    func addressUpdated(_ token: String) {
        guard let user = getUser(token) else { return }
        let view = EditProfileView()
        
        view.currentAddress(user.address.address)
        
        user.address.address = getAddress()
        
        db.save(user)
        view.successfullyUpdateMessage()
    }
    
    func cityUpdated(_ token: String) {
        guard let user = getUser(token) else { return }
        let view = EditProfileView()
        
        view.currentCity(user.address.city)
        
        user.address.city = getCity()
        
        db.save(user)
        view.successfullyUpdateMessage()
    }
    
    func stateUpdated(_ token: String) {
        guard let user = getUser(token) else { return }
        let view = EditProfileView()
        
        view.currentState(user.address.state)
        
        user.address.state = getState()
        
        db.save(user)
        view.successfullyUpdateMessage()
    }
    
    func deleteUser(_ token: String) {
        db.delete(token)
        DeleteProfileView().showSuccessfullyDeleted()
        routeTo().welcome()
    }
    
    /* Assistants Methods */

    private func getUser(_ token: String) -> User? {

        guard let user = db.findUserByToken(token) else { print("Usuário não existe.\n"); return nil }
        
        return user
    }
    
    private func getAddress() -> String {
        view.addressRequest()
        let text = "'endereço'"
        
        guard let address = view.getInput(),
              address.notEmpty(text), address.minLength(text, 3), address.maxLength(text, 12)
        else { return getAddress() }
        
        return address
    }
    
    private func getCity() -> String {
        view.cityRequest()
        let text = "'cidade'"
        
        guard let city = view.getInput(),
              city.notEmpty(text), city.minLength(text, 3), city.maxLength(text, 12)
        else { return getCity() }
        
        return city
    }
    
    private func getState() -> String {
        view.stateRequest()
        let text = "'estado'"
        
        guard let state = view.getInput(),
              state.notEmpty(text), state.minLength(text, 3), state.maxLength(text, 12)
        else { return getState() }
        
        return state
    }
    
}
