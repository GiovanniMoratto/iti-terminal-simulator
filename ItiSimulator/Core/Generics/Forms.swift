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
        routeTo().view.label().showDocumentNumberRequestLabel()
        
        guard let documentNumber = routeTo().view.label().getInput(),
              documentNumber.notEmpty(fieldName: "'CPF'") ?? false,
              documentNumber.isValidCpf() ?? false
        else { return routeTo().controller.form().checkDocumentNumber()}
        
        return documentNumber
    }
    
    func checkPassword() -> String? {
        routeTo().view.label().showPasswordRequestLabel()
        
        guard let password = routeTo().view.label().getInput(),
              password.notEmpty(fieldName: "'senha'") ?? false,
              password.isValidPassword ?? false
        else { return routeTo().controller.form().checkPassword()}
        
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
        routeTo().view.label().showFirstNameRequestLabel()
        
        guard let firstName = routeTo().view.label().getInput(),
              firstName.notEmpty(fieldName: "'primeiro nome'") ?? false,
              firstName.minLength(fieldName: "'primeiro nome'", length: 3) ?? false,
              firstName.maxLength(fieldName: "'primeiro nome'", length: 12) ?? false
        else { return routeTo().controller.form().getFirstName()}
        
        return firstName
    }
    
    func getLastName() -> String? {
        routeTo().view.label().showLastNameRequestLabel()
        
        guard let lastName = routeTo().view.label().getInput(),
              lastName.notEmpty(fieldName: "'sobrenome'") ?? false,
              lastName.minLength(fieldName: "'sobrenome'", length: 3) ?? false,
              lastName.maxLength(fieldName: "'sobrenome'", length: 12) ?? false
        else { return routeTo().controller.form().getLastName()}
        
        return lastName
    }
    
    func getDocumentNumber() -> String? {
        routeTo().view.label().showDocumentNumberRequestLabel()
        
        guard let documentNumber = routeTo().view.label().getInput(),
              documentNumber.notEmpty(fieldName: "'CPF'") ?? false,
              documentNumber.isValidCpf() ?? false,
              documentNumber.uniqueCpf ?? false
        else { return routeTo().controller.form().getDocumentNumber()}
        
        return documentNumber
    }
    
    func getPassword() -> String? {
        routeTo().view.label().showPasswordRequestLabel()
        
        guard let password = routeTo().view.label().getInput(),
              password.isValidPassword ?? false
        else { return routeTo().controller.form().getPassword()}
        
        return password
    }
    
    func getAddress() -> String? {
        routeTo().view.label().showAddressRequestLabel()
        
        guard let address = routeTo().view.label().getInput(),
              address.notEmpty(fieldName: "'endereço'") ?? false,
              address.minLength(fieldName: "'endereço'", length: 3) ?? false,
              address.maxLength(fieldName: "'endereço'", length: 12) ?? false
                
        else { return routeTo().controller.form().getAddress()}
        
        return address
    }
    
    func getCity() -> String? {
        routeTo().view.label().showCityRequestLabel()
        
        guard let city = routeTo().view.label().getInput(),
              city.notEmpty(fieldName: "'cidade'") ?? false,
              city.minLength(fieldName: "'cidade'", length: 3) ?? false,
              city.maxLength(fieldName: "'cidade'", length: 12) ?? false
                
        else { return routeTo().controller.form().getCity()}
        
        return city
    }
    
    func getState() -> String? {
        routeTo().view.label().showStateRequestLabel()
        
        guard let state = routeTo().view.label().getInput(),
              state.notEmpty(fieldName: "'estado'") ?? false,
              state.minLength(fieldName: "'estado'", length: 3) ?? false,
              state.maxLength(fieldName: "'estado'", length: 12) ?? false
        else { return routeTo().controller.form().getState()}
        
        return state
    }
    
    func getHolderAccountNumberManual() -> Int? {
        routeTo().view.label().showHolderAccountRequestLabel()
        
        guard let holderAccountNumber = routeTo().view.label().getInput(),
              holderAccountNumber.isNumeric(fieldName: "'número da conta'") ?? false,
              holderAccountNumber.minLength(fieldName: "'número da conta'", length: 6) ?? false,
              holderAccountNumber.maxLength(fieldName: "'número da conta'", length: 8) ?? false
        else { return routeTo().controller.form().getHolderAccountNumberManual() }
        
        return Int(holderAccountNumber)
    }
    
    func getHolderAccountNumberAuto(token: String?) -> Int? {
        guard let tokenUnwrapped = token else { return nil }
        guard let user = getUser(token: tokenUnwrapped) else { return nil }
        
        let accountNumber: String? = String(user.bankAccount.account)
        
        guard let holderAccountNumber = accountNumber,
              holderAccountNumber.isNumeric(fieldName: "'número da conta'") ?? false,
              holderAccountNumber.minLength(fieldName: "'número da conta'", length: 6) ?? false,
              holderAccountNumber.maxLength(fieldName: "'número da conta'", length: 8) ?? false
        else { return routeTo().controller.form().getHolderAccountNumberAuto(token: tokenUnwrapped) }
        
        return Int(holderAccountNumber)
    }
    
    func getHolderAccountBranchAuto(token: String?) -> Int? {
        guard let tokenUnwrapped = token else { return nil }
        guard let user = getUser(token: tokenUnwrapped) else { return nil }
        
        let branch: String? = String(user.bankAccount.agency)
        
        guard let holderAccountBranch = branch,
              holderAccountBranch.isNumeric(fieldName: "'agência'") ?? false,
              holderAccountBranch.minLength(fieldName: "'agência'", length: 4) ?? false,
              holderAccountBranch.maxLength(fieldName: "'agência'", length: 5) ?? false
        else { return routeTo().controller.form().getHolderAccountNumberAuto(token: tokenUnwrapped) }
        
        return Int(holderAccountBranch)
    }
    
    func setPayment(token: String?) -> Bool? {
        guard let tokenUnwrapped = token else { return nil}
        guard let user = getUser(token: tokenUnwrapped) else { return nil}
        
        let balance = user.bankAccount.balance
        
        routeTo().view.payment().showBillLabel()
        
        guard let billString = routeTo().view.label().getInput() else { return nil}
        guard let bill = Double(billString) else { return nil}
        
        let newBalance = balance - bill
        let newBalanceString = String(newBalance)
        
        guard let database = db.update(token: tokenUnwrapped, attribute: "balance", value: newBalanceString) else { return nil }
        
        if !database {
            print("Operação Inválida")
            return false
        }
        return true
    }
    
}
