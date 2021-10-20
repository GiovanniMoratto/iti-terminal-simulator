//
//  Credentials.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 07/10/21.
//

import Foundation

class Access {
    
    // MARK: - Attributes
    
    var token: String?
    var user: User?
    
    static var shared = Access()
    
    // MARK: - Initializers (Constructors)
    
    private init() {}
    
    // MARK: - Methods
    
    func setToken(_ token: String) {
        if self.token == nil {
            self.token = token
        }
    }
    
    func setUser(_ user: User) {
        if self.user == nil {
            self.user = user
        }
    }
    
    func clearSession() {
        token = nil
        user = nil
    }
    
}
