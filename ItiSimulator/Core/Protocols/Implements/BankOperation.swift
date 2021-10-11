//
//  BankOperation.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

struct BankOperation: BankOperationProtocol {
    
    // MARK: - Attributes
    
    let op = UserOperation()
    let view = BankView()
    
    // MARK: - Methods

    func payment(_ token: String) {
        guard let user = op.getUser(token) else { return }
        
        view.holderAccount(user.firstName, user.lastName, user.documentNumber, user.bankAccount.bank, user.bankAccount.branch, user.bankAccount.account, user.bankAccount.balance)
        
        PaymentView().showBillLabel()
        
        guard let bill = view.getBankInput(),
              bill.isValidBill(user.bankAccount.balance)
        else { return payment(token) }
        
        let newBalance = user.bankAccount.balance - bill
        
        user.bankAccount.balance = newBalance
        
        db.save(user)
        
        PaymentView().successfullyPaymentMessage()
        PaymentView().currentBalance(user.bankAccount.balance)
        UserView().exit()
    }
    
}
