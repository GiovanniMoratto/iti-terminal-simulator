//
//  Address.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

class Address {
    
    // MARK: - Attributes
    
    var address = String()
    var city = String()
    var state = String()
    
    // MARK: - Initializers (Constructors)

    init(){}
    
    init(address: String, city: String, state: String) {
        
        self.address = address
        self.city = city
        self.state = state
    }
}
