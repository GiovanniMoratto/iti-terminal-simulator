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
    
    func threeOrMoreCharacters(field: String?, value: String?) -> Bool {
        guard let unwrappedField = field else { return false }
        guard let unwrappedValue = value else { return false }
        
        if unwrappedValue.count < 3 {
            print("\nO campo \(unwrappedField) deve conter 3 ou mais caracteres.\n")
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
        
        let passwordPattern = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$&*]).{8}$")
        
        if !passwordPattern.evaluate(with: unwrappedValue) {
            print("\nO campo \(unwrappedField) deve conter: ")
            print(atLeast8Characters(value: unwrappedValue).message)
            print(atLeast1UpperCaseLetter(value: unwrappedValue).message)
            print(atLeast1LowerCaseLetter(value: unwrappedValue).message)
            print(atLeast1Number(value: unwrappedValue).message)
            print(atLeast1SpecialCharacter(value: unwrappedValue).message)
            return false
        }
        return true
    }
    
    func atLeast8Characters(value: String?) -> (condition: Bool, message: String) {
        guard let unwrappedValue = value else { return (false, String()) }
        if unwrappedValue.count >= 8 {
            return (true, "[X] No mínimo 8 digitos")
        }
        return (false, "[ ] No mínimo 8 digitos")
    }
    
    func atLeast1UpperCaseLetter(value: String?) -> (condition: Bool, message: String) {
        guard let unwrappedValue = value else { return (false, String()) }
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", ".*[A-Z]+.*")
        if passwordRegex.evaluate(with: unwrappedValue) {
            return (true, "[X] Pelo menos uma letra maiúscula. Ex: A - Z")
        }
        return (false, "[ ] Pelo menos uma letra maiúscula. Ex: A - Z")
    }
    
    func atLeast1LowerCaseLetter(value: String?) -> (condition: Bool, message: String) {
        guard let unwrappedValue = value else { return (false, String()) }
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", ".*[a-z]+.*")
        if passwordRegex.evaluate(with: unwrappedValue) {
            return (true, "[X] Pelo menos uma letra minúscula. Ex: a - z")
        }
        return (false, "[ ] Pelo menos uma letra minúscula. Ex: a - z")
    }
    
    func atLeast1Number(value: String?) -> (condition: Bool, message: String) {
        guard let unwrappedValue = value else { return (false, String()) }
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", ".*[0-9]+.*")
        if passwordRegex.evaluate(with: unwrappedValue) {
            return (true, "[X] Pelo menos um número. Ex: 0 - 9")
        }
        return (false, "[ ] Pelo menos um número. Ex: 0 - 9")
    }
    
    func atLeast1SpecialCharacter(value: String?) -> (condition: Bool, message: String) {
        guard let unwrappedValue = value else { return (false, String()) }
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", ".*[!&^%$#@()/]+.*")
        if passwordRegex.evaluate(with: unwrappedValue) {
            return (true, "[X] Pelo menos um caractere especial. " +
                    "Ex: ! & ^ % $ # @ ( ) / \n")
        }
        return (false, "[ ] Pelo menos um caractere especial. " +
                "Ex: ! & ^ % $ # @ ( ) / \n")
    }
    
}
