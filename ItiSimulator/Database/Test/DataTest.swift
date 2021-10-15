//
//  DataTest.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

class DataTest {
    
    // MARK: - Methods
    
    func initialData() {
    
        let users = [
            User(
                firstName: "Giovanni",
                lastName: "Moratto",
                documentNumber: "051.918.080-10",
                address: Address(
                    address: "Rua da Amizade, 123",
                    city: "Americana",
                    state: "SP"
                ),
                bankAccount: BankAccount(
                    bank: "Itaú Unibanco",
                    branch: 4444,
                    account: 666666,
                    balance: 5000.00,
                    pix: [[.CPF:"051.918.080-10"]]
                ),
                password: "Zup123456!"
            ),
            User(
                firstName: "Tony",
                lastName: "Stark",
                documentNumber: "234.083.290-01",
                address: Address(
                    address: "Rua la longe, 5555",
                    city: "Miami",
                    state: "Florida"
                ),
                bankAccount: BankAccount(
                    bank: "Itaú Unibanco",
                    branch: 5555,
                    account: 777777,
                    balance: 1000000.0,
                    pix: [[.CPF:"234.083.290-01"]]
                ),
                password: "Zup123456!"
            )
        ]
        Database.shared.users = users
    }
    
}
