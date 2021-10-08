//
//  Data.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 07/10/21.
//

import Foundation

class DataTest {
    
    func initialData() {
    
        
        let users = [
            User(
                firstName: "Giovanni",
                lastName: "Moratto",
                documentNumber: "051.918.080-10",
                address: "Rua da Amizade, 123",
                city: "Americana",
                state: "SP",
                bankAccount: BankAccount(
                    bank: "Itaú Unibanco",
                    agency: 4444,
                    account: 666666,
                    balance: 5000.00,
                    creditCards: [
                        CreditCard(
                            accountHolderName: "Giovanni Morato",
                            cardNumber: 000111122223333,
                            expirationDate: "05/2030",
                            codeNumber: 300
                        )
                    ],
                    pixKeys: [Pix.CPF]
                ),
                password: "Zup123456!"
            ),
            User(
                firstName: "Tony",
                lastName: "Stark",
                documentNumber: "234.083.290-01",
                address: "Rua la longe, 5555",
                city: "Miami",
                state: "Florida",
                bankAccount: BankAccount(
                    bank: "Itaú Unibanco",
                    agency: 5555,
                    account: 777777,
                    balance: 1000000.0,
                    creditCards: [
                        CreditCard(
                            accountHolderName: "Tony Stark",
                            cardNumber: 000111122223333,
                            expirationDate: "06/2030",
                            codeNumber: 400
                        )
                    ],
                    pixKeys: [Pix.CPF]
                ),
                password: "Zup123456!"
            )
        ]
        db.users = users
    }
    
}
