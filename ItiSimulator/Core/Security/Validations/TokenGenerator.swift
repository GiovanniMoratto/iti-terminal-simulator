//
//  token.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 07/10/21.
//

import Foundation

extension String {
    
    // MARK: - Attributes
    
    var tokenGenerator: String {
        NSUUID().uuidString
    }
    
}

