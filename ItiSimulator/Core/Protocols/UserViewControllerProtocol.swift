//
//  UserOperationsProtocol.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

protocol UserViewControllerProtocol {
    
    // MARK: - Methods
    
    /* Create User */
    
    func getFirstName() -> String
    
    func getLastName() -> String
    
    func getDocumentNumber() -> String
    
    func getPassword() -> String
    
    /* Overview */
    
    func overview(_ token: String)
    
    /* Display Methods */

    func profileInfo(_ token: String)
    
    /* Update Profile */
    
    func usernameUpdated(_ token: String)
    
    func addressUpdated(_ token: String)
    
    func cityUpdated(_ token: String)
    
    func stateUpdated(_ token: String)
    
}
