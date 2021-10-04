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
    
    // MARK: - Methods
    
    func process() {
        scene.showTitle()
        
        let firstName = firstName(field: "primeiro nome")
        let lastName = lastName(field: "'sobrenome'")
        let document = document(field: "'CPF'")
        let bankAccount = bankAccount(field: "'conta bancária'")
        let password = password(field: "'senha'")
        
        let newUser = CreateUserModel(
            firstName: firstName,
            lastName: lastName,
            document: document,
            bankAccount: bankAccount,
            password: password
        )
        
        let database = db.save(user: newUser.toModel())
        
        guard database != nil, database == true else { return }
        MiniItiViewController().process()
        
    }
    
    func firstName(field: String) -> String {
        scene.showFirstNameForm()
        guard let firstName = scene.getInput(),
              valid.notEmpty(field: field, value: firstName),
              valid.threeOrMoreCharacters(field: field, value: firstName)
        else { return CreateUserViewController().firstName(field: field)}
        return firstName
    }
    
    func lastName(field: String) -> String {
        scene.showLastNameForm()
        guard let lastName = scene.getInput(),
              valid.notEmpty(field: field, value: lastName),
              valid.threeOrMoreCharacters(field: field, value: lastName)
        else { return CreateUserViewController().lastName(field: field)}
        return lastName
    }
    
    func document(field: String) -> String {
        scene.showDocumentForm()
        guard let document = scene.getInput(),
              valid.notEmpty(field: field, value: document),
              //valid.onlyNumbers(field: field, value: document),
              valid.cpf(field: field, value: document)
        else { return CreateUserViewController().document(field: field)}
        return document
    }
    
    func bankAccount(field: String) -> String {
        scene.showBankAccountForm()
        guard let bankAccount = scene.getInput(),
              valid.notEmpty(field: field, value: bankAccount),
              valid.onlyNumbers(field: field, value: bankAccount)
        else { return CreateUserViewController().bankAccount(field: field)}
        return bankAccount
    }
    
    func password(field: String) -> String {
        scene.showPasswordForm()
        guard let password = scene.getInput(),
              valid.notEmpty(field: field, value: password),
              valid.isValidPassword(field: field, value: password)
        else { return CreateUserViewController().password(field: field)}
        return password
    }
}
