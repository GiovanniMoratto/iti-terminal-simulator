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
    
    func password(value: String?) -> Bool {
        guard let unwrappedValue = value else { return false }
        
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        
        if !passwordRegex.evaluate(with: unwrappedValue) {
            return false
        }
        return true
    }
    
    func isValidPassword(field: String?, value: String?) -> Bool {
        guard let unwrappedField = field else { return false }
        guard let unwrappedValue = value else { return false }
        
        if !password(value: unwrappedValue) {
            print("\nO campo \(unwrappedField) deve conter: ")
            
            // Conditions Values
            
            let atLeast8CharactersBool = atLeast8Characters(field: unwrappedField, value: unwrappedValue)
            let atLeast8CharactersMessage = "- No mínimo 8 digitos \n"
            
            let atLeast1UpperCaseLetterBool = atLeast1UpperCaseLetter(field: unwrappedField, value: unwrappedValue)
            let atLeast1UpperCaseLetterMessage = "- Pelo menos uma letra maiúscula. Ex: A - Z \n"
            
            let atLeast1LowerCaseLetterBool = atLeast1LowerCaseLetter(field: unwrappedField, value: unwrappedValue)
            let atLeast1LowerCaseLetterMessage = "-Pelo menos uma letra minúscula. Ex: a - z \n"
            
            let atLeast1NumberBool = atLeast1Number(field: unwrappedField, value: unwrappedValue)
            let atLeast1NumberMessage = "- Pelo menos um número. Ex: 0 - 9 \n"
            
            let atLeast1SpecialCharacterBool = atLeast1SpecialCharacter(field: unwrappedField, value: unwrappedValue)
            let atLeast1SpecialCharacterMessage = "- Pelo menos um caractere especial. " +
                                            "Ex: ! # $ % & ' ( ) * + , - . / : ; < = > ? @ [ ^ _` { | } ~ \n"
            
            let conditions = [atLeast8CharactersBool, atLeast1UpperCaseLetterBool, atLeast1LowerCaseLetterBool, atLeast1NumberBool, atLeast1SpecialCharacterBool]
            
            let messages = [atLeast8CharactersMessage, atLeast1UpperCaseLetterMessage, atLeast1LowerCaseLetterMessage, atLeast1NumberMessage, atLeast1SpecialCharacterMessage]
            
            for condition in conditions.indices {
                if !conditions[condition] as! Bool {
                    let message = messages[condition]
                    print(message)
                }
            }
            return false
        }
        return true
    }
    
    func atLeast8Characters(field: String?, value: String?) -> (condition: Bool, message: String) {
        guard let unwrappedValue = value else { return (false, String()) }
        
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "(?=.{8,})")
        
        if !passwordRegex.evaluate(with: unwrappedValue) {
            //print("- No mínimo 8 digitos \n")
            return (false, "- No mínimo 8 digitos \n")
        }
        return (true, "OK")
    }
    
    func atLeast1UpperCaseLetter(field: String?, value: String?) -> Bool {
        guard let unwrappedValue = value else { return false }
        
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])")
        
        if !passwordRegex.evaluate(with: unwrappedValue) {
            //print("- Pelo menos uma letra maiúscula. Ex: A - Z \n")
            return false
        }
        return true
    }
    
    func atLeast1LowerCaseLetter(field: String?, value: String?) -> Bool {
        guard let unwrappedValue = value else { return false }
        
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "(?=.*[a-z])")
        
        if !passwordRegex.evaluate(with: unwrappedValue) {
            //print("- Pelo menos uma letra minúscula. Ex: a - z \n")
            return false
        }
        return true
    }
    
    func atLeast1Number(field: String?, value: String?) -> Bool {
        guard let unwrappedValue = value else { return false }
        
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "(?=.*[0-9])")
        
        if !passwordRegex.evaluate(with: unwrappedValue) {
            //print("- Pelo menos um número. Ex: 0 - 9 \n")
            return false
        }
        return true
    }
    
    func atLeast1SpecialCharacter(field: String?, value: String?) -> Bool {
        guard let unwrappedValue = value else { return false }
        
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "(?=.*[ !$%&?._-])")
        
        if !passwordRegex.evaluate(with: unwrappedValue) {
            /*print("- Pelo menos um caractere especial. " +
             "Ex: ! # $ % & ' ( ) * + , - . / : ; < = > ? @ [ ^ _` { | } ~ \n")*/
            return false
        }
        return true
    }
    
    
    
}
