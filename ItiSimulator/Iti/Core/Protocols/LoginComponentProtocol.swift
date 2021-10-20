//
//  LoginViewControllerProtocol.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 19/10/21.
//

import Foundation

protocol LoginComponentProtocol {
    
    // MARK: - Methods
    
    /// Method responsible for logging into the application
    ///
    /// - Returns: An optional user with validated login data
    func login() -> User?
    
    /// Method responsible for associating a user with a token and creating a login section
    ///
    /// - Parameter user: The user who will get in a section
    func getCredential(_ user: User)
    
    /// Method responsible for logging out the user in the section
    func logout()
}
