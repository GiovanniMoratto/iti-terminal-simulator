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
        
        PaymentView().showBillValueRequest()
        
        guard let value = view.getInputAsDouble(),
              value.isValidValue(user.bankAccount.balance)
        else { return payment(token) }
        
        let newBalance = user.bankAccount.balance - value
        
        user.bankAccount.balance = newBalance
        
        db.save(user)
        
        PaymentView().successfullyMessage()
        view.currentBalance(user.bankAccount.balance)
        UserView().exit()
    }
    
    func transfer(_ token: String) {
        let scene = TransferView()
        
        guard let user = op.getUser(token) else { return }
        
        scene.originAccount()
        view.holderAccount(user.firstName, user.lastName, user.documentNumber, user.bankAccount.bank, user.bankAccount.branch, user.bankAccount.account, user.bankAccount.balance)
        
        // Receber banco
        scene.transferBankRequest()
        guard let bank = UserView().getInput() else { return }
        
        // Receber agencia
        scene.transferBranchRequest()
        guard let branch = view.getInputAsInt() else { return }
        
        // Receber conta
        scene.transferAccountRequest()
        guard let account = view.getInputAsInt() else { return }
        
        // Encontrar no banco de dados
        
        if !db.findPayee(bank, branch: branch, account: account).condition {
            print("Conta não encontrada, favor rever os dados.\n")
            UserView().exit()
        }
        
        guard let payee = db.findPayee(bank, branch: branch, account: account).user else { return }
        
        scene.destinationAccount()
        view.payeeAccount(payee.firstName, payee.lastName, payee.bankAccount.bank, payee.bankAccount.branch, payee.bankAccount.account)
        
        scene.transferValueRequest()
        guard let value = view.getInputAsDouble(),
              value.isValidValue(user.bankAccount.balance)
        else { return transfer(token) }
        // Realizar transferencia
        
        let newHolderBalance = user.bankAccount.balance - value
        let newPayeeBalance = payee.bankAccount.balance + value
        
        user.bankAccount.balance = newHolderBalance
        payee.bankAccount.balance = newPayeeBalance
        
        db.save(user)
        db.save(payee)
        
        
        TransferView().successfullyMessage()
        view.currentBalance(user.bankAccount.balance)
        UserView().exit()
    }
    
}
