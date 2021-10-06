//
//  Validations.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 04/10/21.
//

import Foundation

class FieldsValidations {
    
    func notEmpty(field: String?, value: String?) -> Bool? {
        guard let fieldUnwrapped = field else { return nil }
        guard let valueUnwrapped = value else { return nil }
        
        if valueUnwrapped.isEmpty {
            print("\nO campo \(fieldUnwrapped) é obrigatório!\n")
            return false
        }
        return true
    }
    
    func minLength(field: String?, value: String?, length: Int?) -> Bool? {
        guard let fieldUnwrapped = field else { return nil }
        guard let valueUnwrapped = value else { return nil }
        guard let lengthUnwrapped = length else { return nil }
        
        if valueUnwrapped.count < lengthUnwrapped {
            print("\nO campo \(fieldUnwrapped) deve conter \(lengthUnwrapped) ou mais caracteres.\n")
            return false
        }
        return true
    }
    
    func maxLength(field: String?, value: String?, length: Int?) -> Bool? {
        guard let fieldUnwrapped = field else { return nil }
        guard let valueUnwrapped = value else { return nil }
        guard let lengthUnwrapped = length else { return nil }
        
        if valueUnwrapped.count >= lengthUnwrapped {
            print("\nO campo \(fieldUnwrapped) deve conter \(lengthUnwrapped) ou menos caracteres.\n")
            return false
        }
        return true
    }
    
    func onlyNumbers(field: String?, value: String?) -> Bool? {
        guard let fieldUnwrapped = field else { return nil }
        guard let valueUnwrapped = value else { return nil }
        
        if !valueUnwrapped.isNumeric {
            print("\nO campo \(fieldUnwrapped) deve conter apenas números.\n")
            return false
        }
        return true
    }
    
    func isValidCpf(field: String?, value: String?) -> Bool? {
        guard let fieldUnwrapped = field else { return nil }
        guard let valueUnwrapped = value else { return nil }
        
        if !valueUnwrapped.isCPF {
            print("\nO campo \(fieldUnwrapped) deve conter um número de CPF válido.\n")
            return false
        }
        return true
    }
    
    func uniqueDocumentNumber(documentNumber: String?) -> Bool? {
        guard let documentNumberUnwrapped = documentNumber else { return nil}
        
        for user in Database.shared.users.indices {
            if Database.shared.users[user].documentNumber == documentNumberUnwrapped {
                print("CPF já cadastrado!")
                return false
            }
        }
        return true
    }
    
    func isValidPassword(field: String?, value: String?) -> Bool? {
        guard let fieldUnwrapped = field else { return nil }
        guard let valueUnwrapped = value else { return nil }
        
        func atLeast8Characters(value: String?) -> String? {
            guard let unwrappedValue = value else { return nil }
            
            if unwrappedValue.count >= 8 {
                return "[X] No mínimo 8 digitos"
            }
            return "[ ] No mínimo 8 digitos"
        }
        
        func atLeast1UpperCaseLetter(value: String?) -> String? {
            guard let unwrappedValue = value else { return nil }
            
            let passwordRegex = NSPredicate(format: "SELF MATCHES %@", ".*[A-Z]+.*")
            if passwordRegex.evaluate(with: unwrappedValue) {
                return "[X] Pelo menos uma letra maiúscula. Ex: A - Z"
            }
            return "[ ] Pelo menos uma letra maiúscula. Ex: A - Z"
        }
        
        func atLeast1LowerCaseLetter(value: String?) -> String? {
            guard let unwrappedValue = value else { return nil }
            
            let passwordRegex = NSPredicate(format: "SELF MATCHES %@", ".*[a-z]+.*")
            if passwordRegex.evaluate(with: unwrappedValue) {
                return "[X] Pelo menos uma letra minúscula. Ex: a - z"
            }
            return "[ ] Pelo menos uma letra minúscula. Ex: a - z"
        }
        
        func atLeast1Number(value: String?) -> String? {
            guard let unwrappedValue = value else { return nil }
            
            let passwordRegex = NSPredicate(format: "SELF MATCHES %@", ".*[0-9]+.*")
            if passwordRegex.evaluate(with: unwrappedValue) {
                return "[X] Pelo menos um número. Ex: 0 - 9"
            }
            return "[ ] Pelo menos um número. Ex: 0 - 9"
        }
        
        func atLeast1SpecialCharacter(value: String?) -> String? {
            guard let unwrappedValue = value else { return nil }
            
            let passwordRegex = NSPredicate(format: "SELF MATCHES %@", ".*[!&^%$#@()/]+.*")
            if passwordRegex.evaluate(with: unwrappedValue) {
                return "[X] Pelo menos um caractere especial. " +
                "Ex: ! & ^ % $ # @ ( ) / \n"
            }
            return "[ ] Pelo menos um caractere especial. " +
            "Ex: ! & ^ % $ # @ ( ) / \n"
        }
        
        let passwordPattern = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{8,}$")
        
        if !passwordPattern.evaluate(with: valueUnwrapped) {
            print("\nO campo \(fieldUnwrapped) deve conter: ")
            
            guard let atLeast8Characters = atLeast8Characters(value: valueUnwrapped) else { return nil }
            print(atLeast8Characters)
            
            guard let atLeast1UpperCaseLetter = atLeast1UpperCaseLetter(value: valueUnwrapped) else { return nil }
            print(atLeast1UpperCaseLetter)
            
            guard let atLeast1LowerCaseLetter = atLeast1LowerCaseLetter(value: valueUnwrapped) else { return nil }
            print(atLeast1LowerCaseLetter)
            
            guard let atLeast1Number = atLeast1Number(value: valueUnwrapped) else { return nil }
            print(atLeast1Number)
            
            guard let atLeast1SpecialCharacter = atLeast1SpecialCharacter(value: valueUnwrapped) else { return nil }
            print(atLeast1SpecialCharacter)
            
            return false
        }
        return true
    }
    
}
