//
//  Validations.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 04/10/21.
//

import Foundation

class Validations {
    
    func notEmpty(field: String?, value: String?) -> Bool {
        guard let unwrappedField = field else { return false }
        guard let unwrappedValue = value else { return false }
        
        if unwrappedValue.isEmpty {
            print("\nO campo \(unwrappedField) é obrigatório!\n")
            return false
        }
        return true
    }
    
    func charactersLength(field: String?, value: String?, length: Int?) -> Bool {
        guard let unwrappedField = field else { return false }
        guard let unwrappedValue = value else { return false }
        guard let unwrappedCharacters = length else { return false }
        
        if unwrappedValue.count < unwrappedCharacters {
            print("\nO campo \(unwrappedField) deve conter \(unwrappedCharacters) ou mais caracteres.\n")
            return false
        }
        return true
    }
    
    func onlyNumbers(field: String?, value: String?) -> Bool {
        guard let unwrappedField = field else { return false }
        guard let unwrappedValue = value else { return false }
        
        if !unwrappedValue.isNumeric {
            print("\nO campo \(unwrappedField) deve conter apenas números.\n")
            return false
        }
        return true
        
    }
    
    func cpf(field: String?, value: String?) -> Bool {
        guard let unwrappedField = field else { return false }
        guard let unwrappedValue = value else { return false }
        
        if !unwrappedValue.isCPF {
            print("\nO campo \(unwrappedField) deve conter um número de CPF válido.\n")
            return false
        }
        return true
    }
    
    func isValidPassword(field: String?, value: String?) -> Bool {
        guard let unwrappedField = field else { return false }
        guard let unwrappedValue = value else { return false }
        
        let passwordPattern = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{8,}$")
        
        if !passwordPattern.evaluate(with: unwrappedValue) {
            print("\nO campo \(unwrappedField) deve conter: ")
            print(atLeast8Characters(value: unwrappedValue))
            print(atLeast1UpperCaseLetter(value: unwrappedValue))
            print(atLeast1LowerCaseLetter(value: unwrappedValue))
            print(atLeast1Number(value: unwrappedValue))
            print(atLeast1SpecialCharacter(value: unwrappedValue))
            return false
        }
        return true
    }
    
    func atLeast8Characters(value: String?) -> String {
        guard let unwrappedValue = value else { return String() }
        if unwrappedValue.count >= 8 {
            return "[X] No mínimo 8 digitos"
        }
        return "[ ] No mínimo 8 digitos"
    }
    
    func atLeast1UpperCaseLetter(value: String?) -> String {
        guard let unwrappedValue = value else { return String() }
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", ".*[A-Z]+.*")
        if passwordRegex.evaluate(with: unwrappedValue) {
            return "[X] Pelo menos uma letra maiúscula. Ex: A - Z"
        }
        return "[ ] Pelo menos uma letra maiúscula. Ex: A - Z"
    }
    
    func atLeast1LowerCaseLetter(value: String?) -> String {
        guard let unwrappedValue = value else { return String() }
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", ".*[a-z]+.*")
        if passwordRegex.evaluate(with: unwrappedValue) {
            return "[X] Pelo menos uma letra minúscula. Ex: a - z"
        }
        return "[ ] Pelo menos uma letra minúscula. Ex: a - z"
    }
    
    func atLeast1Number(value: String?) -> String {
        guard let unwrappedValue = value else { return String() }
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", ".*[0-9]+.*")
        if passwordRegex.evaluate(with: unwrappedValue) {
            return "[X] Pelo menos um número. Ex: 0 - 9"
        }
        return "[ ] Pelo menos um número. Ex: 0 - 9"
    }
    
    func atLeast1SpecialCharacter(value: String?) -> String {
        guard let unwrappedValue = value else { return String() }
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", ".*[!&^%$#@()/]+.*")
        if passwordRegex.evaluate(with: unwrappedValue) {
            return "[X] Pelo menos um caractere especial. " +
                    "Ex: ! & ^ % $ # @ ( ) / \n"
        }
        return "[ ] Pelo menos um caractere especial. " +
                "Ex: ! & ^ % $ # @ ( ) / \n"
    }
    
}
