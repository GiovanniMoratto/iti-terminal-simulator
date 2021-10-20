//
//  UserViewsProtocol.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

protocol UserViewComponentProtocol {
    
    // MARK: - Methods: Input Request Labels Messages
    
    /// Method responsible for requesting the user's first name input
    func userFirstNameRequest()
    
    /// Method responsible for requesting the user's last name input
    func userLastNameRequest()
    
    /// Method responsible for requesting the user's document number input
    func userDocumentNumberRequest()
    
    /// Method responsible for requesting the user's password input
    func userPasswordRequest()
    
    /// Method responsible for requesting the user's address input
    func userAddressRequest()
    
    /// Method responsible for requesting the user's city input
    func userCityRequest()
    
    /// Method responsible for requesting the user's state input
    func userStateRequest()
    
    // MARK: - Methods: Receive Input
    
    /// Method responsible for receiving the input
    ///
    /// - Returns: An optional string of the value
    func getInput() -> String?
    
    /// Method responsible for receiving input and converting to navigation value
    ///
    /// - Returns: An integer value corresponding to the chosen option
    func getNavigation() -> Int
    
    // MARK: - Methods: Show Information Labels Messages
    
    /// Method responsible for displaying the return option
    func exitDisplay()
    
    /// Method responsible for displaying the username
    ///
    /// - Parameter firstName: The User's first name
    /// - Parameter lastName: The User's last name
    func usernameDisplay(_ firstName: String, _ lastName: String)
    
    /// Method responsible for displaying the document number
    ///
    /// - Parameter documentNumber: The User's document number
    func documentNumberDisplay(_ documentNumber: String)
    
    /// Method responsible for displaying the address
    ///
    /// - Parameter address: The User's address
    func addressDisplay(_ address: String)
    
    /// Method responsible for displaying the city
    ///
    /// - Parameter city: The User's city
    func cityDisplay(_ city: String)
    
    /// Method responsible for displaying the state
    ///
    /// - Parameter state: The User's state
    func stateDisplay(_ state: String)
    
    /// Method responsible for displaying the user's overview
    ///
    /// - Parameter firstName: The User's first name
    /// - Parameter lastName: The User's last name
    /// - Parameter balance: The User's bank account balance
    func overviewDisplay(_ firstName: String, _ lastName: String, _ balance: Double)
    
}
