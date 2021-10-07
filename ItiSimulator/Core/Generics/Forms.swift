//
//  Forms.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 06/10/21.
//

import Foundation

class Forms {
    
    // MARK: - Methods
    
    // Login Forms
    func checkDocumentNumber() -> String? {
        router().view.label().showDocumentNumberRequestLabel()
        
        guard let documentNumber = router().view.label().getInput(),
              documentNumber.notEmpty(fieldName: "'CPF'") ?? false,
              documentNumber.isValidCpf() ?? false
        else { return router().controller.form().checkDocumentNumber()}
        
        return documentNumber
    }
    
    func checkPassword() -> String? {
        router().view.label().showPasswordRequestLabel()
        
        guard let password = router().view.label().getInput(),
              password.notEmpty(fieldName: "'senha'") ?? false,
              password.isValidPassword ?? false
        else { return router().controller.form().checkPassword()}
        
        return password
    }
    
    func isValidLogin(documentNumber: String?, password: String?) -> (condition: Bool?, user: User?) {
        guard let documentUnwrapped = documentNumber else { return (nil, nil)}
        guard let passwordUnwrapped = password else { return (nil, nil)}
        
        guard let user = db.find(documentNumber: documentUnwrapped) else { return (nil, nil)}
        
        if user.password != passwordUnwrapped {
            print("Senha Inválida!")
            return (false, User())
        }
        return (true, user)
    }
    
    func getCredential(user: User?) -> String? {
        guard let userUnwrapped = user else { return nil }
        
        let credential = Access(token: String().tokenGenerator, user: userUnwrapped)
        
        guard let access = db.save(credential: credential) else { return nil }
        
        if !access {
            return nil
        }
        return credential.token
    }
    
    func getUser(token: String?) -> User? {
        guard let tokenUnwrapped = token else { return nil }
        guard let user = db.find(token: tokenUnwrapped) else { return nil }
        
        return user
    }
    
    func getPersonalInfo(token: String?) -> (firstName: String?, lastName: String?, balance: Double?) {
        guard let tokenUnwrapped = token else { return (nil, nil, nil) }
        guard let user = getUser(token: tokenUnwrapped) else { return (nil, nil, nil) }
        
        return (user.firstName, user.lastName, user.bankAccount.balance)
    }
    
    func getProfileInfo(token: String?) -> (firstName: String?, lastName: String?, documentNumber: String?, address: String?, city: String?, state: String?) {
        guard let tokenUnwrapped = token else { return (nil, nil, nil, nil, nil, nil) }
        guard let user = getUser(token: tokenUnwrapped) else { return (nil, nil, nil, nil, nil, nil) }
        
        return (user.firstName, user.lastName, user.documentNumber, user.address, user.city, user.state)
    }
    
    // Create user
    func getFirstName() -> String? {
        router().view.label().showFirstNameRequestLabel()
        
        guard let firstName = router().view.label().getInput(),
              firstName.notEmpty(fieldName: "'primeiro nome'") ?? false,
              firstName.minLength(fieldName: "'primeiro nome'", length: 3) ?? false,
              firstName.maxLength(fieldName: "'primeiro nome'", length: 12) ?? false
        else { return router().controller.form().getFirstName()}
        
        return firstName
    }
    
    func getLastName() -> String? {
        router().view.label().showLastNameRequestLabel()
        
        guard let lastName = router().view.label().getInput(),
              lastName.notEmpty(fieldName: "'sobrenome'") ?? false,
              lastName.minLength(fieldName: "'sobrenome'", length: 3) ?? false,
              lastName.maxLength(fieldName: "'sobrenome'", length: 12) ?? false
        else { return router().controller.form().getLastName()}
        
        return lastName
    }
    
    func getDocumentNumber() -> String? {
        router().view.label().showDocumentNumberRequestLabel()
        
        guard let documentNumber = router().view.label().getInput(),
              documentNumber.notEmpty(fieldName: "'CPF'") ?? false,
              documentNumber.isValidCpf() ?? false,
              documentNumber.uniqueCpf ?? false
        else { return router().controller.form().getDocumentNumber()}
        
        return documentNumber
    }
    
    func getPassword() -> String? {
        router().view.label().showPasswordRequestLabel()
        
        guard let password = router().view.label().getInput(),
              password.isValidPassword ?? false
        else { return router().controller.form().getPassword()}
        
        return password
    }
    
    func getAddress() -> String? {
        router().view.label().showAddressRequestLabel()
        
        guard let address = router().view.label().getInput(),
              address.notEmpty(fieldName: "'endereço'") ?? false,
              address.minLength(fieldName: "'endereço'", length: 3) ?? false,
              address.maxLength(fieldName: "'endereço'", length: 12) ?? false
                
        else { return router().controller.form().getAddress()}
        
        return address
    }
    
    func getCity() -> String? {
        router().view.label().showCityRequestLabel()
        
        guard let city = router().view.label().getInput(),
              city.notEmpty(fieldName: "'cidade'") ?? false,
              city.minLength(fieldName: "'cidade'", length: 3) ?? false,
              city.maxLength(fieldName: "'cidade'", length: 12) ?? false
                
        else { return router().controller.form().getCity()}
        
        return city
    }
    
    func getState() -> String? {
        router().view.label().showStateRequestLabel()
        
        guard let state = router().view.label().getInput(),
              state.notEmpty(fieldName: "'estado'") ?? false,
              state.minLength(fieldName: "'estado'", length: 3) ?? false,
              state.maxLength(fieldName: "'estado'", length: 12) ?? false
        else { return router().controller.form().getState()}
        
        return state
    }
    
}
