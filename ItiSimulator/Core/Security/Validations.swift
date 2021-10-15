//
//  Validations.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

extension String {
    
    // MARK: - Attributes
    
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
        
        if !(temp1 == d1 && temp2 == d2) {
            print("\nO campo 'CPF' deve conter um número de CPF válido.\n")
            return false
        }
        return true
    }
    
    /*-----------------------------------------------------------------------------------*/
    
    var isValidPassword: Bool {
        
        func atLeast8Characters(_ value: String) -> String {
            if value.count >= 8 {
                return "[X] No mínimo 8 digitos"
            }
            return "[ ] No mínimo 8 digitos"
        }
        
        func atLeast1UpperCaseLetter(_ value: String) -> String {
            let regex = NSPredicate(format: "SELF MATCHES %@", ".*[A-Z]+.*")
            
            if regex.evaluate(with: value) {
                return "[X] Pelo menos uma letra maiúscula. Ex: A - Z"
            }
            return "[ ] Pelo menos uma letra maiúscula. Ex: A - Z"
        }
        
        func atLeast1LowerCaseLetter(_ value: String) -> String {
            let regex = NSPredicate(format: "SELF MATCHES %@", ".*[a-z]+.*")
            
            if regex.evaluate(with: value) {
                return "[X] Pelo menos uma letra minúscula. Ex: a - z"
            }
            return "[ ] Pelo menos uma letra minúscula. Ex: a - z"
        }
        
        func atLeast1Number(_ value: String) -> String {
            let regex = NSPredicate(format: "SELF MATCHES %@", ".*[0-9]+.*")
            
            if regex.evaluate(with: value) {
                return "[X] Pelo menos um número. Ex: 0 - 9"
            }
            return "[ ] Pelo menos um número. Ex: 0 - 9"
        }
        
        func atLeast1SpecialCharacter(_ value: String) -> String {
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
            print(atLeast8Characters(self))
            print(atLeast1UpperCaseLetter(self))
            print(atLeast1LowerCaseLetter(self))
            print(atLeast1Number(self))
            print(atLeast1SpecialCharacter(self))
            return false
        }
        return true
    }
    
    /*-----------------------------------------------------------------------------------*/
    
    var tokenGenerator: String {
        NSUUID().uuidString
    }
    
    /*-----------------------------------------------------------------------------------*/
    
    var isEmail: Bool {
        let pattern = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        
        if !pattern.evaluate(with: self) {
            print("\nO campo deve conter um endereço de e-mail válido.\n")
            return false
        }
        return true
    }
    
    /*-----------------------------------------------------------------------------------*/
    
    var isPhone: Bool {
        let pattern = NSPredicate(format: "SELF MATCHES %@", "^\\+(?:[0-9]?){6,14}[0-9]$")
        
        if !pattern.evaluate(with: self) {
            print("\nO campo deve conter um número de telefone válido.\n")
            return false
        }
        return true
    }
    
    /*-----------------------------------------------------------------------------------*/
    
    var QRCodeGenerator: String {
        NSUUID().uuidString.lowercased()
    }
    
    
    // MARK: - Methods
    
    func notEmpty(_ nameWrapped: String?) -> Bool {
        guard let name = nameWrapped else { return false }
        
        if self.isEmpty {
            print("\nO campo \(name) é obrigatório!\n")
            return false
        }
        return true
    }
    
    /*-----------------------------------------------------------------------------------*/
    
    func minLength(_ fieldNameWrapped: String?, _ lengthWrapped: Int?) -> Bool {
        guard let fieldName = fieldNameWrapped else { return false }
        guard let length = lengthWrapped else { return false }
        
        if self.count < length {
            print("\nO campo \(fieldName) deve conter \(length) ou mais caracteres.\n")
            return false
        }
        return true
    }
    
    /*-----------------------------------------------------------------------------------*/
    
    func maxLength(_ fieldNameWrapped: String?, _ lengthWrapped: Int?) -> Bool {
        guard let fieldName = fieldNameWrapped else { return false }
        guard let length = lengthWrapped else { return false }
        
        if self.count >= length {
            print("\nO campo \(fieldName) deve conter \(length) ou menos caracteres.\n")
            return false
        }
        return true
    }
    
    /*-----------------------------------------------------------------------------------*/
    
    func isNumeric(_ fieldNameWrapped: String?) -> Bool {
        guard let fieldName = fieldNameWrapped else { return false }
        
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        
        if !Set(self).isSubset(of: nums) {
            print("\nO campo \(fieldName) deve conter apenas números.\n")
            return false
        }
        return true
    }
    
    /*-----------------------------------------------------------------------------------*/
    
    func isValidCpf() -> Bool {
        
        if !self.isCPF {
            print("\nO campo 'CPF' deve conter um número de CPF válido.\n")
            return false
        }
        return true
    }
    
    /*-----------------------------------------------------------------------------------*/
    
    func unique(_ field: UniqueValue) -> Bool {
        
        switch field {
        case .documentNumber:
            for index in db.users.indices {
                if db.users[index].documentNumber == self {
                    print("CPF já cadastrado!\n")
                    return false
                }
            }
            return true
        case .pixDocumentNumber:
            for userIndex in db.users.indices {
                for pixIndex in db.users[userIndex].bankAccount.pix.indices {
                    for (_,_) in db.users[userIndex].bankAccount.pix[pixIndex] {
                        if db.users[userIndex].bankAccount.pix[pixIndex] == [PixType.CPF:self] {
                            print("Este CPF já foi cadastrado como chave PIX!\n")
                            return false
                        }
                    }
                }
            }
        case .pixEmail:
            for userIndex in db.users.indices {
                for pixIndex in db.users[userIndex].bankAccount.pix.indices {
                    for (_,_) in db.users[userIndex].bankAccount.pix[pixIndex] {
                        if db.users[userIndex].bankAccount.pix[pixIndex] == [PixType.email:self] {
                            print("Este E-mail já foi cadastrado como chave PIX!\n")
                            return false
                        }
                    }
                }
            }
        case .pixPhone:
            for userIndex in db.users.indices {
                for pixIndex in db.users[userIndex].bankAccount.pix.indices {
                    for (_,_) in db.users[userIndex].bankAccount.pix[pixIndex] {
                        if db.users[userIndex].bankAccount.pix[pixIndex] == [PixType.phoneNumber:self] {
                            print("Este Telefone já foi cadastrado como chave PIX!\n")
                            return false
                        }
                    }
                }
            }
        }
        return true
    }
    
}

enum UniqueValue {
    case documentNumber
    case pixDocumentNumber
    case pixEmail
    case pixPhone
}

extension Double {
    
    // MARK: - Methods
    
    func isValidValue(_ balance: Double) -> Bool {
        
        if self > balance {
            print("Saldo insuficiente.\n")
            return false
        }
        return true
    }
    
}
