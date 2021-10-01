//
//  Controller.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 30/09/21.
//

import Foundation

class Controller {
    
    // MARK: - Methods
    
    func createAccount(request: UserRequest) {
        
        db.users.append(request.toModel())
        db.initialData()

    }
    
//    func getAccount(login: String) ->
    
    /*
    func editAccount(id: Int) {
        
        var user = db.data
        
        db.data.
        
    }
     */
    
}
