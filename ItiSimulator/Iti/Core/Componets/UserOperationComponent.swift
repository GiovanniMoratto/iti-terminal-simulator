//
//  UserOperation.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

struct UserOperationComponent: UserOperationComponentProtocol {
    
    // MARK: - Attributes
    
    let view: UserViewComponentProtocol
    
    // MARK: - Initializers (Constructors)
    
    init(view: UserViewComponentProtocol) {
        self.view = view
    }
    
    // MARK: - Methods
    
    func createUser() -> User {
        let newUser = User(
            firstName: getFirstName(),
            lastName: getLastName(),
            documentNumber: getDocumentNumber(),
            password: getPassword()
        )
        
        db.save(newUser)
        return newUser
    }

    func readUser() {
        guard let user = getUser() else { return }
        
        view.username(user.firstName, user.lastName)
        view.documentNumber(user.documentNumber)
        view.address(user.address.address)
        view.city(user.address.city)
        view.state(user.address.state)
    }
    
    func updateUser(_ field: UpdateUserField, _ view: EditProfileView) {
        
        guard let user = getUser() else { return }
        guard let userUpdated = updateChoices(field, user, view) else { return }
        
        db.save(userUpdated)
        view.successfullyUpdateMessage()
    }
    
    func deleteUser(_ view:  DeleteProfileView) {
        
        db.delete()
        
        view.showSuccessfullyDeleted()
        
        routeTo.welcome()
    }
    
    func overview() {
        guard let user = getUser() else { return }

        view.overview(user.firstName, user.lastName, user.bankAccount.balance)
    }
    
    /* Assistants Methods */

    /// Method responsible for extracting the user in the section
    private func getUser() -> User? {
        guard let user: User = session.user else { return nil }
        return user
    }
    
    /* Create User */
    
    /// Method responsible for sending "First Name" Request View, receiving input and validating it
    private func getFirstName() -> String {
        view.firstNameRequest()
        let text = "'primeiro nome'"
        
        guard let firstName = view.getInput(),
                firstName.notEmpty(text), firstName.minLength(text, 3), firstName.maxLength(text, 12)
        else { return getFirstName() }
        
        return firstName
    }
    
    /// Method responsible for sending "Last Name" Request View, receiving input and validating it
    private func getLastName() -> String {
        view.lastNameRequest()
        let text = "'sobrenome'"
        
        guard let lastName = view.getInput(),
              lastName.notEmpty(text), lastName.minLength(text, 3), lastName.maxLength(text, 12)
        else { return getLastName() }
        
        return lastName
    }
    
    /// Method responsible for sending "Document Number" Request View, receiving input and validating it
    /// This method checks if there is a document number with this value in the user database and refuses if it already exists
    private func getDocumentNumber() -> String {
        view.documentNumberRequest()
        
        guard let documentNumber = view.getInput(),
              documentNumber.notEmpty("'CPF'"), documentNumber.isValidCpf(), documentNumber.unique(.documentNumber)
        else { return getDocumentNumber() }
        
        return documentNumber
    }
    
    /// Method responsible for sending "Password" Request View, receiving input and validating it
    private func getPassword() -> String {
        view.passwordRequest()
        
        guard let password = view.getInput(),
              password.notEmpty("'senha'"), password.isValidPassword
        else { return getPassword() }
        
        return password
    }
    
    /* Update User */

    /// Method responsible for sending "Address" Request View, receiving input and validating it
    private func getAddress() -> String {
        view.addressRequest()
        let text = "'endereço'"
        
        guard let address = view.getInput(),
              address.notEmpty(text), address.minLength(text, 3), address.maxLength(text, 12)
        else { return getAddress() }
        
        return address
    }
    
    /// Method responsible for sending "City" Request View, receiving input and validating it
    private func getCity() -> String {
        view.cityRequest()
        let text = "'cidade'"
        
        guard let city = view.getInput(),
              city.notEmpty(text), city.minLength(text, 3), city.maxLength(text, 12)
        else { return getCity() }
        
        return city
    }
    
    /// Method responsible for sending "State" Request View, receiving input and validating it
    private func getState() -> String {
        view.stateRequest()
        let text = "'estado'"
        
        guard let state = view.getInput(),
              state.notEmpty(text), state.minLength(text, 3), state.maxLength(text, 12)
        else { return getState() }
        
        return state
    }
    
    /// Method responsible for Updating the "Username", receiving input and associating it
    /// - Parameter user: The user to be updated
    /// - Parameter view: The view for display
    private func usernameUpdated(_ user: User, _ view: EditProfileView) -> User {
        
        view.currentUsername(user.firstName, user.lastName)
        user.firstName = getFirstName()
        user.lastName = getLastName()
        
        return user
    }
    
    /// Method responsible for Updating the "Address", receiving input and associating it
    /// - Parameter user: The user to be updated
    /// - Parameter view: The view for display
    private func addressUpdated(_ user: User, _ view: EditProfileView) -> User {
        
        view.currentAddress(user.address.address)
        user.address.address = getAddress()
        
        return user
    }
    
    /// Method responsible for Updating the "City", receiving input and associating it
    /// - Parameter user: The user to be updated
    /// - Parameter view: The view for display
    private func cityUpdated(_ user: User, _ view: EditProfileView) -> User {
        
        view.currentCity(user.address.city)
        user.address.city = getCity()
        
        return user
    }
    
    /// Method responsible for Updating the "State", receiving input and associating it
    /// - Parameter user: The user to be updated
    /// - Parameter view: The view for display
    private func stateUpdated(_ user: User, _ view: EditProfileView) -> User {
        
        view.currentState(user.address.state)
        user.address.state = getState()
        
        return user
    }
    
    /// Method responsible for Directing the Update request to its corresponding method
    /// - Parameter field: The field to be updated
    /// - Parameter user: The user to be updated
    /// - Parameter view: The view for display
    private func updateChoices(_ field: UpdateUserField, _ user: User, _ view: EditProfileView) -> User? {
        
        let dicionary: [UpdateUserField:User] = [.name:usernameUpdated(user, view),
                                                 .address:addressUpdated(user, view),
                                                 .city:cityUpdated(user, view),
                                                 .state:stateUpdated(user,view)
        ]
        return dicionary[field] ?? nil
    }
    
}
