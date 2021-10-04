//
//  UserRequest.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 29/09/21.
//

import Foundation

struct CreateUserModel {
    
    // MARK: - Attributes
    
    let firstName: String
    let lastName: String
    let document: String
    let bankAccount: String
    let password: String
    
    // MARK: - Methods
    
    func toModel() -> UserModel {
        return UserModel(
            firstName: self.firstName,
            lastName: self.lastName,
            document: self.document,
            bankAccount: self.bankAccount,
            password: self.password
        )
    }
}
