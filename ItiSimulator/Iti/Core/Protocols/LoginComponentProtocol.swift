//
//  LoginViewControllerProtocol.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 19/10/21.
//

import Foundation

protocol LoginComponentProtocol {
    
    func login() -> User?
    
    func getCredential(_ user: User)
    
    func logout()
}
