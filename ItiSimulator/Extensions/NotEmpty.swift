//
//  NotEmpty.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 06/10/21.
//

import Foundation

extension String {
    
    func notEmpty(fieldName: String?) -> Bool {
        guard let fieldUnwrapped = fieldName else { return false }
        
        if self.isEmpty {
            print("\nO campo \(fieldUnwrapped) é obrigatório!\n")
            return false
        }
        return true
    }
    
}
