//
//  Unique.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 06/10/21.
//

import Foundation

extension String {
    
    // MARK: - Attributes
    
    var uniqueCpf: Bool? {
        for user in db.users.indices {
            if db.users[user].documentNumber == self {
                print("CPF já cadastrado!")
                return false
            }
        }
        return true
    }
    
    // MARK: - Methods
    
//    func unique(attribute: String?) -> Bool? {
//        guard let attributeUnwrapped = attribute else { return false}
//
//        if attributeUnwrapped == "documentNumber" {
//            for user in db.users.indices {
//                if db.users[user].documentNumber == self {
//                    print("CPF já cadastrado!")
//                    return false
//                }
//            }
//            return true
//        }
//        else if attributeUnwrapped == "phoneNumber" {
//            for user in db.users.indices {
//                if db.users[user].phoneNumber == self {
//                    print("Telefone já cadastrado!")
//                    return false
//                }
//            }
//            return true
//        }
//        return false
//    }
}
