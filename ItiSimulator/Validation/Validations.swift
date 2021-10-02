//
//  Validations.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 01/10/21.
//

import Foundation

class Validations {
    
    func notEmpty(fields: [String]) -> Bool {
        for field in fields.indices {
            let value = fields[field]
            
            if fields.isEmpty, value.isEmpty {
                print("O Campo \(value) é obrigatório!")
                return false
            } else {
                return true
            }
        }
    }
    
    func threeOrMoreCharacters(fields: [String]) -> Bool {
        for field in fields.indices {
            let value = fields[field]
            
            if value.count < 3 {
                print("O Campo \(value) deve conter 3 ou mais caracteres.")
                return false
            } else {
                return true
            }
        }
    }
    
    func onlyNumbers(fields: [String]) -> Bool {
        for field in fields.indices {
            let value = fields[field]
            
            if value.isNumeric {
                print("O Campo \(value) deve conter apenas números.")
                return false
            } else {
                return true
            }
        }
    }
    
}
