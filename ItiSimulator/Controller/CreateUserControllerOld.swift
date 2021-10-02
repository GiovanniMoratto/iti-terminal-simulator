//
//  Controller.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 30/09/21.
//

import Foundation

class CreateUserControllerOld {
    
    var check = Validations()
    
    // MARK: - Methods
    
    func createAccount(firstName: String, lastName: String, document: String, bankAccount: String, login: String, password: String) -> UserModel {
        
        let fields = [firstName, lastName, document, bankAccount, login, password]
        let numberFields = [document, bankAccount, login]
        
        var notEmpty = check.notEmpty(fields: fields)
        var threeOrMoreCharacters = check.threeOrMoreCharacters(fields: fields)
        var onlyNumbers = check.onlyNumbers(fields: numberFields)
        
        var dataValidation = [notEmpty, threeOrMoreCharacters, onlyNumbers]
        
        for data in dataValidation.indices {
            let value = dataValidation[data]
            
            if value == false {
                print(
                break
            }
        }
        
        return newUser
    }
    
    func add(request: CreateUserModel) -> UserModel {
        let newUser = request.toModel()
        db.users.append(newUser)
        return newUser
    }
}
