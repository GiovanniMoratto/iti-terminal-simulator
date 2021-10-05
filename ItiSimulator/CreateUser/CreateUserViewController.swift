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
    let valid = Validations()
    let login = LoginViewController()
    
    // MARK: - Methods
    
    func process() {
        scene.showTitle()
        
        guard let firstName = firstName(field: "primeiro nome") else { return }
        guard let lastName = lastName(field: "'sobrenome'") else { return }
        guard let document = document(field: "'CPF'") else { return }
        guard let bankAccount = bankAccount(field: "'conta bancária'") else { return }
        guard let password = password(field: "'senha'") else { return }
        
        let newUser = CreateUserModel(
            firstName: firstName,
            lastName: lastName,
            document: document,
            bankAccount: bankAccount,
            password: password
        )
        
        guard let database = db.save(user: newUser.toModel()) else { return }
        
        if !database {
            print("Desculpe, estamos com problemas")
        }
        
        guard let user = login.isValidLogin(document: document, password: password).user else { return }
        
        MiniItiViewController().process(user: user)
    }
    
    func firstName(field: String?) -> String? {
        scene.showFirstNameForm()
        guard let firstName = scene.getInput(),
              valid.notEmpty(field: field, value: firstName) ?? false,
              valid.minLength(field: field, value: firstName, length: 3) ?? false,
              valid.maxLength(field: field, value: firstName, length: 12) ?? false
        else { return CreateUserViewController().firstName(field: field)}
        return firstName
    }
    
    func lastName(field: String?) -> String? {
        scene.showLastNameForm()
        guard let lastName = scene.getInput(),
              valid.notEmpty(field: field, value: lastName) ?? false,
              valid.minLength(field: field, value: lastName, length: 3) ?? false,
              valid.maxLength(field: field, value: lastName, length: 12) ?? false
        else { return CreateUserViewController().lastName(field: field)}
        return lastName
    }
    
    func document(field: String?) -> String? {
        scene.showDocumentForm()
        guard let document = scene.getInput(),
              valid.notEmpty(field: field, value: document) ?? false,
              valid.cpf(field: field, value: document) ?? false
        else { return CreateUserViewController().document(field: field)}
        return document
    }
    
    func bankAccount(field: String?) -> String? {
        scene.showBankAccountForm()
        guard let bankAccount = scene.getInput(),
              valid.notEmpty(field: field, value: bankAccount) ?? false,
              valid.onlyNumbers(field: field, value: bankAccount) ?? false,
              valid.minLength(field: field, value: bankAccount, length: 4) ?? false
        else { return CreateUserViewController().bankAccount(field: field)}
        return bankAccount
    }
    
    func password(field: String?) -> String? {
        scene.showPasswordForm()
        guard let password = scene.getInput(),
              valid.notEmpty(field: field, value: password) ?? false,
              valid.isValidPassword(field: field, value: password) ?? false
        else { return CreateUserViewController().password(field: field)}
        return password
    }
}
