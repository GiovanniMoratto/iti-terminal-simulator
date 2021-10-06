//
//  StringExtension.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 01/10/21.
//

import Foundation

extension String {
    
    /*
    var isNumeric: Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
    
    
    var isCPF: Bool {
        let numbers = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        guard numbers.count == 11 else { return false }
        
        let set = NSCountedSet(array: Array(numbers))
        guard set.count != 1 else { return false }
        
        let i1 = numbers.index(numbers.startIndex, offsetBy: 9)
        let i2 = numbers.index(numbers.startIndex, offsetBy: 10)
        let i3 = numbers.index(numbers.startIndex, offsetBy: 11)
        let d1 = Int(numbers[i1..<i2])
        let d2 = Int(numbers[i2..<i3])
        
        var temp1 = 0, temp2 = 0
        
        for i in 0...8 {
            let start = numbers.index(numbers.startIndex, offsetBy: i)
            let end = numbers.index(numbers.startIndex, offsetBy: i+1)
            let char = Int(numbers[start..<end])
            
            temp1 += char! * (10 - i)
            temp2 += char! * (11 - i)
        }
        
        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : 11-temp1
        
        temp2 += temp1 * 2
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : 11-temp2
        
        return temp1 == d1 && temp2 == d2
    }
    
    func notEmpty(field: String?, value: String?) -> Bool {
        guard let fieldUnwrapped = field else { return false }
        guard let valueUnwrapped = value else { return false }
        
        if valueUnwrapped.isEmpty {
            print("\nO campo \(fieldUnwrapped) é obrigatório!\n")
            return false
        }
        return true
    }
    
    func minLength(field: String?, value: String?, length: Int?) -> Bool {
        guard let fieldUnwrapped = field else { return false }
        guard let valueUnwrapped = value else { return false }
        guard let lengthUnwrapped = length else { return false }
        
        if valueUnwrapped.count < lengthUnwrapped {
            print("\nO campo \(fieldUnwrapped) deve conter \(lengthUnwrapped) ou mais caracteres.\n")
            return false
        }
        return true
    }
    
    func maxLength(field: String?, value: String?, length: Int?) -> Bool {
        guard let fieldUnwrapped = field else { return false }
        guard let valueUnwrapped = value else { return false }
        guard let lengthUnwrapped = length else { return false }
        
        if valueUnwrapped.count >= lengthUnwrapped {
            print("\nO campo \(fieldUnwrapped) deve conter \(lengthUnwrapped) ou menos caracteres.\n")
            return false
        }
        return true
    }
    
    func onlyNumbers(field: String?, value: String?) -> Bool {
        guard let fieldUnwrapped = field else { return false }
        guard let valueUnwrapped = value else { return false }
        
        if !valueUnwrapped.isNumeric {
            print("\nO campo \(fieldUnwrapped) deve conter apenas números.\n")
            return false
        }
        return true
    }
     
    
    func isValidCpf(field: String?, value: String?) -> Bool {
        guard let fieldUnwrapped = field else { return false }
        guard let valueUnwrapped = value else { return false }
        
        if !valueUnwrapped.isCPF {
            print("\nO campo \(fieldUnwrapped) deve conter um número de CPF válido.\n")
            return false
        }
        return true
    }
    
    func uniqueDocumentNumber(documentNumber: String?) -> Bool {
        guard let documentNumberUnwrapped = documentNumber else { return false}
        
        for user in Database.shared.users.indices {
            if Database.shared.users[user].documentNumber == documentNumberUnwrapped {
                print("CPF já cadastrado!")
                return false
            }
        }
        return true
    }
    
    var isValidPassword: Bool {
        
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
    
    func isValidPassword(value: String?) -> Bool {
        guard let valueUnwrapped = value else { return false }
        
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
        
        if !pattern.evaluate(with: valueUnwrapped) {
            print("\nO campo 'senha' deve conter: ")
            print(atLeast8Characters(value: valueUnwrapped))
            print(atLeast1UpperCaseLetter(value: valueUnwrapped))
            print(atLeast1LowerCaseLetter(value: valueUnwrapped))
            print(atLeast1Number(value: valueUnwrapped))
            print(atLeast1SpecialCharacter(value: valueUnwrapped))
            return false
        }
        return true
    }
    */
}
