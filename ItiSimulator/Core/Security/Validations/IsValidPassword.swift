//
//  IsPassword.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 06/10/21.
//

import Foundation

extension String {
    
    // MARK: - Attributes
    
    var isValidPassword: Bool? {
        
        func atLeast8Characters(value: String) -> String {
            if value.count >= 8 {
                return "[X] No mínimo 8 digitos"
            }
            return "[ ] No mínimo 8 digitos"
        }
        
        func atLeast1UpperCaseLetter(value: String) -> String {
            let regex = NSPredicate(format: "SELF MATCHES %@", ".*[A-Z]+.*")
            
            if regex.evaluate(with: value) {
                return "[X] Pelo menos uma letra maiúscula. Ex: A - Z"
            }
            return "[ ] Pelo menos uma letra maiúscula. Ex: A - Z"
        }
        
        func atLeast1LowerCaseLetter(value: String) -> String {
            let regex = NSPredicate(format: "SELF MATCHES %@", ".*[a-z]+.*")
            
            if regex.evaluate(with: value) {
                return "[X] Pelo menos uma letra minúscula. Ex: a - z"
            }
            return "[ ] Pelo menos uma letra minúscula. Ex: a - z"
        }
        
        func atLeast1Number(value: String) -> String {
            let regex = NSPredicate(format: "SELF MATCHES %@", ".*[0-9]+.*")
            
            if regex.evaluate(with: value) {
                return "[X] Pelo menos um número. Ex: 0 - 9"
            }
            return "[ ] Pelo menos um número. Ex: 0 - 9"
        }
        
        func atLeast1SpecialCharacter(value: String) -> String {
            let regex = NSPredicate(format: "SELF MATCHES %@", ".*[!&^%$#@()/]+.*")
            
            if regex.evaluate(with: value) {
                return "[X] Pelo menos um caractere especial. " +
                "Ex: ! & ^ % $ # @ ( ) / \n"
            }
            return "[ ] Pelo menos um caractere especial. " +
            "Ex: ! & ^ % $ # @ ( ) / \n"
        }
        
        let pattern = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{8,}$")
        
        if !pattern.evaluate(with: self) {
            print("\nO campo 'senha' deve conter: ")
            print(atLeast8Characters(value: self))
            print(atLeast1UpperCaseLetter(value: self))
            print(atLeast1LowerCaseLetter(value: self))
            print(atLeast1Number(value: self))
            print(atLeast1SpecialCharacter(value: self))
            return false
        }
        return true
        
    }
    
}
