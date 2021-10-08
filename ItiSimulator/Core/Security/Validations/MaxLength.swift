//
//  MaxLength.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 06/10/21.
//

import Foundation

extension String {
    
    // MARK: - Methods
    
    func maxLength(_ fieldNameWrapped: String?, _ lengthWrapped: Int?) -> Bool? {
        guard let fieldName = fieldNameWrapped else { return false }
        guard let length = lengthWrapped else { return false }
        
        if self.count >= length {
            print("\nO campo \(fieldName) deve conter \(length) ou menos caracteres.\n")
            return false
        }
        return true
    }
    
}
