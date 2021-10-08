//
//  NotEmpty.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 06/10/21.
//

import Foundation

extension String {
    
    // MARK: - Methods
    
    func notEmpty(_ nameWrapped: String?) -> Bool? {
        guard let name = nameWrapped else { return false }
        
        if self.isEmpty {
            print("\nO campo \(name) é obrigatório!\n")
            return false
        }
        return true
    }
    
}
