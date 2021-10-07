//
//  DatabaseViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

class DatabaseViewController {
    
    // MARK: - Methods
    
    func process() {
        router().view.database().showTitle()
        
        for user in db.users.indices {
            print(db.users[user].self)
        }
    }
}
