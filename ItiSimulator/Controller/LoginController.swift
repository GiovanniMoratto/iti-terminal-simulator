//
//  LoginController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 01/10/21.
//

import Foundation

class LoginController {
    
    // MARK: - Methods
    
    func createAccount(request: CreateUserModel) -> UserModel {
        let newUser = request.toModel()
        db.users.append(newUser)
        return newUser
    }
}
