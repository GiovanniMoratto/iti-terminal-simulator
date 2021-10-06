//
//  CreateUserViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 02/10/21.
//

import Foundation

class CreateUserViewController {
    
    // MARK: - Attributes
    
    let scene = CreateUserView()
    let valid = FieldsValidations()
    let login = LoginViewController()
    
    // MARK: - Methods
    
    func process() {
        scene.showTitle()
        
        guard let firstName = getFirstName(field: "'primeiro nome'") else { return }
        guard let lastName = getLastName(field: "'sobrenome'") else { return }
        guard let documentNumber = getDocumentNumber(field: "'CPF'") else { return }
        guard let bankAccount = getBankAccount(field: "'conta bancária'") else { return }
        guard let password = getPassword(field: "'senha'") else { return }
        
        let newUser = CreateUserModel(
            firstName: firstName,
            lastName: lastName,
            documentNumber: documentNumber,
            bankAccount: bankAccount,
            password: password
        )
        
        guard let database = db.save(user: newUser.toModel()) else { return }
        
        if !database {
            print("Desculpe, estamos com problemas")
        }
        
        guard let user = login.isValidLogin(documentNumber: documentNumber, password: password).user else { return }
        
        MiniItiMainViewController().process(user: user)
    }
    
    func getFirstName(field: String?) -> String? {
        scene.showFirstNameForm()
        guard let firstName = scene.getInput(),
              valid.notEmpty(field: field, value: firstName) ?? false,
              valid.minLength(field: field, value: firstName, length: 3) ?? false,
              valid.maxLength(field: field, value: firstName, length: 12) ?? false
        else { return CreateUserViewController().getFirstName(field: field)}
        return firstName
    }
    
    func getLastName(field: String?) -> String? {
        scene.showLastNameForm()
        guard let lastName = scene.getInput(),
              valid.notEmpty(field: field, value: lastName) ?? false,
              valid.minLength(field: field, value: lastName, length: 3) ?? false,
              valid.maxLength(field: field, value: lastName, length: 12) ?? false
        else { return CreateUserViewController().getLastName(field: field)}
        return lastName
    }
    
    func getDocumentNumber(field: String?) -> String? {
        scene.showDocumentNumberForm()
        guard let documentNumber = scene.getInput(),
              valid.notEmpty(field: field, value: documentNumber) ?? false,
              valid.isValidCpf(field: field, value: documentNumber) ?? false,
              valid.uniqueDocumentNumber(documentNumber: documentNumber) ?? false
        else { return CreateUserViewController().getDocumentNumber(field: field)}
        return documentNumber
    }
    
    func getBankAccount(field: String?) -> String? {
        scene.showBankAccountForm()
        guard let bankAccount = scene.getInput(),
              valid.notEmpty(field: field, value: bankAccount) ?? false,
              valid.onlyNumbers(field: field, value: bankAccount) ?? false,
              valid.minLength(field: field, value: bankAccount, length: 4) ?? false
        else { return CreateUserViewController().getBankAccount(field: field)}
        return bankAccount
    }
    
    func getPassword(field: String?) -> String? {
        scene.showPasswordForm()
        guard let password = scene.getInput(), password.isValidPassword
        else { return CreateUserViewController().getPassword(field: field)}
        return password
    }

}
