//
//  MaxLength.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 06/10/21.
//

import Foundation

extension String {
    
    func maxLength(fieldName: String?, length: Int?) -> Bool {
        guard let fieldUnwrapped = fieldName else { return false }
        guard let lengthUnwrapped = length else { return false }
        
        if self.count >= lengthUnwrapped {
            print("\nO campo \(fieldUnwrapped) deve conter \(lengthUnwrapped) ou menos caracteres.\n")
            return false
        }
        return true
    }
    
}
