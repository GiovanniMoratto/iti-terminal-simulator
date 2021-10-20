//
//  UserOperationsProtocol.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

protocol UserOperationComponentProtocol {
    
    // MARK: - Methods
    
    /// Method responsible for Create of User requesting
    func createUser() -> User
    
    /// Method responsible for Display of Profile data requesting
    func readUser()
    
    /// Method responsible for Update of Profile requesting
    /// - Parameter field: The field to be updated in the Profile
    /// - Parameter view: The view for display
    func updateUser(_ field: UpdateUserField, _ view: EditProfileView)
    
    /// Method responsible for Delete of User requesting
    /// - Parameter view: The view for display
    func deleteUser(_ view:  DeleteProfileView)
    
    /// Method responsible for show some Profile data
    func overview()
    
}
