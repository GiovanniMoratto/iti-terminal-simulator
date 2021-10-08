//
//  OnlyNumbers.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 06/10/21.
//

import Foundation

extension String {
    
    // MARK: - Methods
    
    func isNumeric(_ fieldNameWrapped: String?) -> Bool? {
        guard let fieldName = fieldNameWrapped else { return false }
        
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        
        if !Set(self).isSubset(of: nums) {
            print("\nO campo \(fieldName) deve conter apenas números.\n")
            return false
        }
        return true
    }
    
}
