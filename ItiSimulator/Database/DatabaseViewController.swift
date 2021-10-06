//
//  DatabaseViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

class DatabaseViewController {
    
    // MARK: - Attributes
    
    let scene = DatabaseView()
    
    // MARK: - Methods
    
    func process() {
        scene.showTitle()
        
        for user in Database.shared.users.indices {
            print(Database.shared.users[user])
        }
    }
}
