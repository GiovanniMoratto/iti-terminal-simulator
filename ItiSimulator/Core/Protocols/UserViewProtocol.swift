//
//  UserViewsProtocol.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

protocol UserViewProtocol {
    
    // MARK: - Methods
    
    /* Request Labels Messages */
    
    func firstNameRequest()
    
    func lastNameRequest()
    
    func documentNumberRequest()
    
    func passwordRequest()
    
    func addressRequest()
    
    func cityRequest()
    
    func stateRequest()
    
    /* Display Labels Messages */
    
    func username(_ firstName: String, _ lastName: String)
    
    func documentNumber(_ documentNumber: String)
    
    func address(_ address: String)
    
    func city(_ city: String)
    
    func state(_ state: String)
    
    /* Custom Labels Messages */
    
    func exit()
    
    func overview(_ firstName: String, _ lastName: String, _ balance: Double)
    
    func getInput() -> String?

    func getNavigation() -> Int
    
}
