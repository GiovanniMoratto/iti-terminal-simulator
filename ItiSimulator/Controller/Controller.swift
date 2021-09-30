//
//  Controller.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 30/09/21.
//

import Foundation

class Controller {
    
    // MARK: - Methods
    
    func createAccount(newAccount: UserRequest) {
        db.data.append(newAccount.toModel())
    }
    
}
