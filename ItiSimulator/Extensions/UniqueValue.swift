//
//  Unique.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 06/10/21.
//

import Foundation

extension String {
    
    func unique(fieldName: String?) -> Bool {
        guard let fieldUnwrapped = fieldName else { return false}
        
        if fieldUnwrapped == "documentNumber" {
            for user in Database.shared.users.indices {
                if Database.shared.users[user].documentNumber == self {
                    print("CPF já cadastrado!")
                    return false
                }
            }
            return true
        }
        else if fieldUnwrapped == "phoneNumber" {
            for user in Database.shared.users.indices {
                if Database.shared.users[user].phoneNumber == self {
                    print("Telefone já cadastrado!")
                    return false
                }
            }
            return true
        }
        return false
    }
}
