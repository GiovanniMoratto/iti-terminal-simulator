//
//  DatabaseViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 15/10/21.
//

import Foundation

class DatabaseViewController: DatabaseView {
    
    // MARK: - Methods
    
    func process() {
        showTitle()
        
        for index in db.users.indices {
            let userView = DataUserView(
                firstname: db.users[index].firstName,
                lastName: db.users[index].lastName,
                documentNumber: db.users[index].documentNumber,
                address: db.users[index].address.address,
                city: db.users[index].address.city,
                state: db.users[index].address.state,
                bank: db.users[index].bankAccount.bank,
                branch: db.users[index].bankAccount.branch,
                account: db.users[index].bankAccount.account,
                balance: db.users[index].bankAccount.balance,
                pix: db.users[index].bankAccount.pix,
                password: db.users[index].password)
            
            print(userView)
        }
    }
    
}
