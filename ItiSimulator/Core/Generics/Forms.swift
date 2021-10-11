//
//  Forms.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 06/10/21.
//

import Foundation

class Forms {
    
    /*
     Métodos responsáveis por chamada labels, recebimento de input, validação e retornos.
     Os retornos podem ser o valor de input ou retornar o próprio método, caso ele não passe na validação.
     */
    
    // MARK: - Methods
    
    /* Login */
//
//    func checkDocumentNumber() -> String? {
//        routeTo().view.label().showDocumentNumberRequestLabel()
//
//        guard let documentNumber = routeTo().view.label().getInput(),
//              documentNumber.notEmpty("'CPF'") ?? false,
//              documentNumber.isValidCpf() ?? false
//        else { return routeTo().controller.form().checkDocumentNumber()}
//
//        return documentNumber
//    }
//
//    func checkPassword() -> String? {
//        routeTo().view.label().showPasswordRequestLabel()
//
//        guard let password = routeTo().view.label().getInput(),
//              password.notEmpty("'senha'") ?? false,
//              password.isValidPassword ?? false
//        else { return routeTo().controller.form().checkPassword()}
//
//        return password
//    }
//
//    func isValidLogin(_ documentNumberWrapped: String?, _ passwordWrapped: String?) -> (condition: Bool?, user: User?) {
//        guard let documentNumber = documentNumberWrapped else { return (nil, nil)}
//        guard let password = passwordWrapped else { return (nil, nil)}
//
//        guard let user = db.findUserByDocumentNumber(documentNumber) else { return (nil, nil)}
//
//        if user.password != password {
//            print("Senha Inválida!")
//            return (nil, nil)
//        }
//        return (true, user)
//    }
//
//    func getCredential(_ userWrapped: User?) -> String? {
//        guard let user = userWrapped else { return nil }
//
//        let credential = UserAccess(token: String().tokenGenerator, user: user)
//
//        guard let access = db.saveAccess(credential) else { return nil }
//
//        if !access {
//            return nil
//        }
//        return credential.token
//    }
//
//    /* Create and Update Profile */
//
//    func getFirstName() -> String? {
//        routeTo().view.label().showFirstNameRequestLabel()
//
//        guard let firstName = routeTo().view.label().getInput(),
//              firstName.notEmpty("'primeiro nome'") ?? false,
//              firstName.minLength("'primeiro nome'", 3) ?? false,
//              firstName.maxLength("'primeiro nome'", 12) ?? false
//        else { return routeTo().controller.form().getFirstName()}
//
//        return firstName
//    }
//
//    func getLastName() -> String? {
//        routeTo().view.label().showLastNameRequestLabel()
//
//        guard let lastName = routeTo().view.label().getInput(),
//              lastName.notEmpty("'sobrenome'") ?? false,
//              lastName.minLength("'sobrenome'", 3) ?? false,
//              lastName.maxLength("'sobrenome'", 12) ?? false
//        else { return routeTo().controller.form().getLastName()}
//
//        return lastName
//    }
//
//    func getDocumentNumber() -> String? {
//        routeTo().view.label().showDocumentNumberRequestLabel()
//
//        guard let documentNumber = routeTo().view.label().getInput(),
//              documentNumber.notEmpty("'CPF'") ?? false,
//              documentNumber.isValidCpf() ?? false,
//              documentNumber.uniqueCpf ?? false
//        else { return routeTo().controller.form().getDocumentNumber()}
//
//        return documentNumber
//    }
//
//    func getPassword() -> String? {
//        routeTo().view.label().showPasswordRequestLabel()
//
//        guard let password = routeTo().view.label().getInput(),
//              password.isValidPassword ?? false
//        else { return routeTo().controller.form().getPassword()}
//
//        return password
//    }
//
//    func getAddress() -> String? {
//        routeTo().view.label().showAddressRequestLabel()
//
//        guard let address = routeTo().view.label().getInput(),
//              address.notEmpty("'endereço'") ?? false,
//              address.minLength("'endereço'", 3) ?? false,
//              address.maxLength("'endereço'", 12) ?? false
//
//        else { return routeTo().controller.form().getAddress()}
//
//        return address
//    }
//
//    func getCity() -> String? {
//        routeTo().view.label().showCityRequestLabel()
//
//        guard let city = routeTo().view.label().getInput(),
//              city.notEmpty("'cidade'") ?? false,
//              city.minLength("'cidade'", 3) ?? false,
//              city.maxLength("'cidade'", 12) ?? false
//
//        else { return routeTo().controller.form().getCity()}
//
//        return city
//    }
//
//    func getState() -> String? {
//        routeTo().view.label().showStateRequestLabel()
//
//        guard let state = routeTo().view.label().getInput(),
//              state.notEmpty("'estado'") ?? false,
//              state.minLength("'estado'", 3) ?? false,
//              state.maxLength("'estado'", 12) ?? false
//        else { return routeTo().controller.form().getState()}
//
//        return state
//    }
//
//    /* Display Methods */
//
//    func getOverview(_ tokenWrapped: String?) -> (firstName: String?, lastName: String?, balance: Double?) {
//        guard let token = tokenWrapped else { return (nil, nil, nil) }
//
//        guard let user = getUser(token) else { return (nil, nil, nil) }
//
//        return (user.firstName, user.lastName, user.bankAccount.balance)
//    }
//
//    func getProfileInfo(_ tokenWrapped: String?) -> (firstName: String?, lastName: String?, documentNumber: String?, address: String?, city: String?, state: String?) {
//        guard let token = tokenWrapped else { return (nil, nil, nil, nil, nil, nil) }
//
//        guard let user = getUser(token) else { return (nil, nil, nil, nil, nil, nil) }
//
//        return (user.firstName, user.lastName, user.documentNumber, user.address, user.city, user.state)
//    }
    
    /* Assistants Methods */
    
    func getUser(_ tokenWrapped: String?) -> User? {
        guard let token = tokenWrapped else { return nil }
        
        guard let user = db.findUserByToken(token) else { return nil }
        
        return user
    }

    /* Bank Services */
    
    func getHolderAccountNumberManual() -> Int? {
        routeTo().view.label().showHolderAccountRequestLabel()
        
        guard let holderAccountNumber = routeTo().view.label().getInput(),
              holderAccountNumber.isNumeric("'número da conta'") ?? false,
              holderAccountNumber.minLength("'número da conta'", 6) ?? false,
              holderAccountNumber.maxLength("'número da conta'", 8) ?? false
        else { return routeTo().controller.form().getHolderAccountNumberManual() }
        
        return Int(holderAccountNumber)
    }
    
    func getHolderAccountNumberAuto(_ tokenWrapped: String?) -> Int? {
        guard let token = tokenWrapped else { return nil }
        
        guard let user = getUser(token) else { return nil }
        
        let accountNumber: String? = String(user.bankAccount.account)
        
        guard let holderAccountNumber = accountNumber,
              holderAccountNumber.isNumeric("'número da conta'") ?? false,
              holderAccountNumber.minLength("'número da conta'", 6) ?? false,
              holderAccountNumber.maxLength("'número da conta'", 8) ?? false
        else { return routeTo().controller.form().getHolderAccountNumberAuto(token) }
        
        return Int(holderAccountNumber)
    }
    
    func getHolderAccountBranchAuto(_ tokenWrapped: String?) -> Int? {
        guard let token = tokenWrapped else { return nil }
        
        guard let user = getUser(token) else { return nil }
        
        let branch: String? = String(user.bankAccount.agency)
        
        guard let holderAccountBranch = branch,
              holderAccountBranch.isNumeric("'agência'") ?? false,
              holderAccountBranch.minLength("'agência'", 4) ?? false,
              holderAccountBranch.maxLength("'agência'", 5) ?? false
        else { return routeTo().controller.form().getHolderAccountNumberAuto(token) }
        
        return Int(holderAccountBranch)
    }
    
    func setPayment(_ tokenWrapped: String?) -> Bool? {
        guard let token = tokenWrapped else { return nil}
        
        guard let user = getUser(token) else { return nil}
        
        let balance = user.bankAccount.balance
        
        routeTo().view.payment().showBillLabel()
        
        guard let billString = routeTo().view.label().getInput() else { return nil}
        guard let bill = Double(billString) else { return nil}
        
        let newBalance = balance - bill
        let newBalanceString = String(newBalance)
        
        guard let database = db.updateUser(key: token, where: "balance", of: newBalanceString) else { return nil }
        
        if !database {
            print("Operação Inválida")
            return false
        }
        return true
    }
    
}
