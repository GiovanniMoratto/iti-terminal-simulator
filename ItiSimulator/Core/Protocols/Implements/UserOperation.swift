//
//  UserOperation.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

struct UserOperation: UserOperationProtocol {

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
              documentNumber.notEmpty("'CPF'"), documentNumber.isValidCpf(), documentNumber.uniqueCpf
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
    
    /* Login */
    
    func getDocumentNumberToLogin() -> String {
        view.documentNumberRequest()
        
        guard let documentNumber = view.getInput(),
              documentNumber.notEmpty("'CPF'"), documentNumber.isValidCpf()
        else { return getDocumentNumberToLogin() }
        
        return documentNumber
    }
    
    func isValidLogin(_ documentNumber: String, _ password: String) -> (condition: Bool, user: User?) {
                
        guard let user = db.findUserByDocumentNumber(documentNumber) else { return (false, nil) }
        
        if user.password != password {
            print("Senha Inválida!")
            return (false, nil)
        }
        
        return (true, user)
    }
    
    func getCredential(_ user: User) -> String {
        
        let credential = UserAccess(token: String().tokenGenerator, user: user)
        
        db.save(credential)
        
        return credential.token
    }
    
    /* Overview */
    
    func overview(_ token: String) {
        
        let firstName = getOverview(token).firstName
        let lastName = getOverview(token).lastName
        let balance = getOverview(token).balance
        
        view.overview(firstName, lastName, balance)
    }
    
    /* Display Methods */
    
    func profileInfo(_ token: String){
        let firstName = getProfileInfo(token).firstName
        let lastName = getProfileInfo(token).lastName
        let documentNumber = getProfileInfo(token).documentNumber
        let address = getProfileInfo(token).address
        let city = getProfileInfo(token).city
        let state = getProfileInfo(token).state
        
        view.username(firstName, lastName)
        view.documentNumber(documentNumber)
        view.address(address)
        view.city(city)
        view.state(state)
    }
    
    /* Update Profile */
    
    func usernameUpdated(_ token: String) {
        let currentFirstName = getProfileInfo(token).firstName
        let currentLasName = getProfileInfo(token).lastName
        EditProfileView().currentUsername(currentFirstName, currentLasName)
        
        guard let user = getUser(token) else { return }
        
        user.firstName = getFirstName()
        user.lastName = getLastName()
        
        db.save(user)
    }
    
    func addressUpdated(_ token: String) {
        let currentAddress = getProfileInfo(token).address
        EditProfileView().currentAddress(currentAddress)
        
        guard let user = getUser(token) else { return }
        
        user.address.address = getAddress()
        
        db.save(user)
    }
    
    func cityUpdated(_ token: String) {
        let currentCity = getProfileInfo(token).city
        EditProfileView().currentCity(currentCity)
        
        guard let user = getUser(token) else { return }
        
        user.address.city = getCity()
        
        db.save(user)
    }
    
    func stateUpdated(_ token: String) {
        let currentState = getProfileInfo(token).state
        EditProfileView().currentState(currentState)
        
        guard let user = getUser(token) else { return }
        
        user.address.state = getState()
        
        db.save(user)
    }
    
    /* Assistants Methods */
    
    func getUser(_ token: String) -> User? {

        guard let user = db.findUserByToken(token) else { return nil }
        
        return user
    }
    
    func getOverview(_ token: String) -> (firstName: String, lastName: String, balance: Double) {
        
        guard let user = getUser(token) else { return (String(), String(), Double()) }
        
        return (user.firstName, user.lastName, user.bankAccount.balance)
    }
    
    func getProfileInfo(_ token: String) -> (firstName: String, lastName: String, documentNumber: String, address: String, city: String, state: String) {
        
        guard let user = getUser(token) else { return (String(), String(), String(), String(), String(), String()) }
        
        return (user.firstName, user.lastName, user.documentNumber, user.address.address, user.address.city, user.address.state)
    }
    
    func getAddress() -> String {
        view.addressRequest()
        let text = "'endereço'"
        
        guard let address = view.getInput(),
              address.notEmpty(text), address.minLength(text, 3), address.maxLength(text, 12)
        else { return getAddress() }
        
        return address
    }
    
    func getCity() -> String {
        view.cityRequest()
        let text = "'cidade'"
        
        guard let city = view.getInput(),
              city.notEmpty(text), city.minLength(text, 3), city.maxLength(text, 12)
        else { return getCity() }
        
        return city
    }
    
    func getState() -> String {
        view.stateRequest()
        let text = "'estado'"
        
        guard let state = view.getInput(),
              state.notEmpty(text), state.minLength(text, 3), state.maxLength(text, 12)
        else { return getState() }
        
        return state
    }
    
}
