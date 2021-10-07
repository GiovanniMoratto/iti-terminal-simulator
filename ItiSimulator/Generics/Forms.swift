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
        view.label().showDocumentNumberRequestLabel()
        
        guard let documentNumber = view.label().getInput(),
              documentNumber.notEmpty(fieldName: "'CPF'") ?? false,
              documentNumber.isValidCpf() ?? false
        else { return controller.form().checkDocumentNumber()}
        
        return documentNumber
    }
    
    func checkPassword() -> String? {
        view.label().showPasswordRequestLabel()
        
        guard let password = view.label().getInput(),
              password.notEmpty(fieldName: "'senha'") ?? false,
              password.isValidPassword ?? false
        else { return controller.form().checkPassword()}
        
        return password
    }
    
    func isValidLogin(documentNumber: String?, password: String?) -> (condition: Bool?, user: UserModel?) {
        guard let documentUnwrapped = documentNumber else { return (nil, nil)}
        guard let passwordUnwrapped = password else { return (nil, nil)}
        
        guard let user = db.find(documentNumber: documentUnwrapped) else { return (nil, nil)}
        
        if user.password != passwordUnwrapped {
            print("Senha Inválida!")
            return (false, UserModel())
        }
        return (true, user)
    }
    
    // Create user
    func getFirstName() -> String? {
        view.label().showFirstNameRequestLabel()
        
        guard let firstName = view.label().getInput(),
              firstName.notEmpty(fieldName: "'primeiro nome'") ?? false,
              firstName.minLength(fieldName: "'primeiro nome'", length: 3) ?? false,
              firstName.maxLength(fieldName: "'primeiro nome'", length: 12) ?? false
        else { return controller.form().getFirstName()}
        
        return firstName
    }
    
    func getLastName() -> String? {
        view.label().showLastNameRequestLabel()
        
        guard let lastName = view.label().getInput(),
              lastName.notEmpty(fieldName: "'sobrenome'") ?? false,
              lastName.minLength(fieldName: "'sobrenome'", length: 3) ?? false,
              lastName.maxLength(fieldName: "'sobrenome'", length: 12) ?? false
        else { return controller.form().getLastName()}
        
        return lastName
    }
    
    func getDocumentNumber() -> String? {
        view.label().showDocumentNumberRequestLabel()
        
        guard let documentNumber = view.label().getInput(),
              documentNumber.notEmpty(fieldName: "'CPF'") ?? false,
              documentNumber.isValidCpf() ?? false,
              documentNumber.unique(attribute: "documentNumber") ?? false
        else { return controller.form().getDocumentNumber()}
        
        return documentNumber
    }
    
    func getBankAccount() -> String? {
        view.label().showBankAccountRequestLabel()
        
        guard let bankAccount = view.label().getInput(),
              bankAccount.notEmpty(fieldName: "'conta bancária'") ?? false,
              bankAccount.isNumeric(fieldName: "'conta bancária'") ?? false,
              bankAccount.minLength(fieldName: "'conta bancária'", length: 4) ?? false
        else { return controller.form().getBankAccount()}
        
        return bankAccount
    }
    
    func getPassword() -> String? {
        view.label().showPasswordRequestLabel()
        
        guard let password = view.label().getInput(),
              password.isValidPassword ?? false
        else { return controller.form().getPassword()}
        
        return password
    }
    
    func getAddress() -> String? {
        view.label().showAddressRequestLabel()
        
        guard let address = view.label().getInput(),
              address.notEmpty(fieldName: "'endereço'") ?? false,
              address.minLength(fieldName: "'endereço'", length: 3) ?? false,
              address.maxLength(fieldName: "'endereço'", length: 12) ?? false
                
        else { return controller.form().getAddress()}
        
        return address
    }
    
    func getCity() -> String? {
        view.label().showCityRequestLabel()
        
        guard let city = view.label().getInput(),
              city.notEmpty(fieldName: "'cidade'") ?? false,
              city.minLength(fieldName: "'cidade'", length: 3) ?? false,
              city.maxLength(fieldName: "'cidade'", length: 12) ?? false
                
        else { return controller.form().getCity()}
        
        return city
    }
    
    func getState() -> String? {
        view.label().showStateRequestLabel()
        
        guard let state = view.label().getInput(),
              state.notEmpty(fieldName: "'estado'") ?? false,
              state.minLength(fieldName: "'estado'", length: 3) ?? false,
              state.maxLength(fieldName: "'estado'", length: 12) ?? false
        else { return controller.form().getState()}
        
        return state
    }
    
    func getPhoneNumber() -> String? {
        view.label().showPhoneNumberRequestLabel()
        
        guard let phoneNumber = view.label().getInput(),
              phoneNumber.notEmpty(fieldName: "'telefone'") ?? false,
              phoneNumber.minLength(fieldName: "'telefone'", length: 3) ?? false,
              phoneNumber.maxLength(fieldName: "'telefone'", length: 12) ?? false
        else { return controller.form().getPhoneNumber()}
        
        return phoneNumber
    }
    
    func getEmail() -> String? {
        view.label().showEmailRequestLabel()
        
        guard let email = view.label().getInput(),
              email.notEmpty(fieldName: "'e-mail'") ?? false,
              email.minLength(fieldName: "'e-mail'", length: 3) ?? false,
              email.maxLength(fieldName: "'e-mail'", length: 12) ?? false
        else { return controller.form().getEmail()}
        
        return email
    }
    
}
