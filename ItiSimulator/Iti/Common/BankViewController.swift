//
//  BankOperation.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

struct BankViewController: BankViewControllerProtocol {
    
    // MARK: - Attributes
    
    // Instância a view do banco
    let bankView = BankView()
    let userView = UserView()
    
    // MARK: - Methods

    func payment(_ token: String) {
        
        // Identifica usuário
        guard let user = getUser(token) else { return }
        
        // Instância a view de pagamento
        let scene = PaymentView()
        
        // Exibe informções do Titular
        bankView.holderAccount(user.firstName, user.lastName, user.documentNumber, user.bankAccount.bank, user.bankAccount.branch, user.bankAccount.account, user.bankAccount.balance)

        // Rebebe input e valida
        let value = getValue(user)
        
        // Confirmação
        var loop = true
        
        while loop {
            scene.confirmDataPayment()
            
            // Exibe informções do Titular
            bankView.originAccount()
            bankView.holderAccount(user.firstName, user.lastName, user.documentNumber, user.bankAccount.bank, user.bankAccount.branch, user.bankAccount.account, user.bankAccount.balance)
            
            // Exibe valor do pagamento
            scene.paymentValue(value)
            
            // Exibe mensagem de confirmação
            bankView.confirmDataRequest()
            
            switch userView.getNavigation() {
            case 1:
                // Realizar Pagamento
                let newBalance = user.bankAccount.balance - value
                user.bankAccount.balance = newBalance
                
                db.save(user)
                
                scene.successfullyMessage()
                bankView.currentBalance(user.bankAccount.balance)
                userView.exit()
                loop = false
            case 0:
                payment(token)
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
    func transfer(_ token: String) {
        
        // Identifica usuário
        guard let user = getUser(token) else { return }
        
        // Instância a view de transferência
        let scene = TransferView()
        
        // Exibe informções do Titular
        bankView.originAccount()
        bankView.holderAccount(user.firstName, user.lastName, user.documentNumber, user.bankAccount.bank, user.bankAccount.branch, user.bankAccount.account, user.bankAccount.balance)
                
        // Receber input do usuário
        let bank = getBank()
        let branch = getBranch()
        let account = getAccount()
        
        // Encontrar no banco de dados
        if !db.findPayee(bank, branch, account).condition {
            print("Conta não encontrada, favor rever os dados.\n")
            userView.exit()
        }
        
        guard let payee = db.findPayee(bank, branch, account).user else { return }
        
        bankView.destinationAccount()
        bankView.payeeAccount(payee.firstName, payee.lastName, payee.bankAccount.bank, payee.bankAccount.branch, payee.bankAccount.account)
        
        // Rebebe input e valida
        let value = getValue(user)
        
        //Confirmação
        var loop = true
        
        while loop {
            // Exibe mensagem de confimarção
            scene.confirmDataTransfer()
            // Exibe informções do Titular
            bankView.originAccount()
            bankView.holderAccount(user.firstName, user.lastName, user.documentNumber, user.bankAccount.bank, user.bankAccount.branch, user.bankAccount.account, user.bankAccount.balance)
            // Exibe informções do Beneficiado
            bankView.destinationAccount()
            bankView.payeeAccount(payee.firstName, payee.lastName, payee.bankAccount.bank, payee.bankAccount.branch, payee.bankAccount.account)
            // Exibe valor
            bankView.value(value)
            // Exibe pergunta
            bankView.confirmDataRequest()
            
            switch userView.getNavigation() {
            case 1:
                // Realizar transferencia
                let newHolderBalance = user.bankAccount.balance - value
                let newPayeeBalance = payee.bankAccount.balance + value
                
                user.bankAccount.balance = newHolderBalance
                payee.bankAccount.balance = newPayeeBalance
                
                db.save(user)
                db.save(payee)
                
                scene.successfullyMessage()
                bankView.currentBalance(user.bankAccount.balance)
                userView.exit()
                loop = false
            case 0:
                transfer(token)
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
        
    }
    
    /* Assistants Methods */

    private func getUser(_ token: String) -> User? {

        guard let user = db.findUserByToken(token) else { print("Usuário não existe.\n"); return nil }
        
        return user
    }
    
    private func getBank() -> String {
        TransferView().transferBankRequest()
        
        guard let bank = userView.getInput() else { return getBank() }
        
        return bank
    }
    
    private func getBranch() -> Int {
        TransferView().transferBranchRequest()
        
        guard let branch = bankView.getInputAsInt() else { return getBranch() }
        
        return branch
    }
    
    private func getAccount() -> Int {
        TransferView().transferAccountRequest()
        
        guard let account = bankView.getInputAsInt() else { return getAccount() }
        
        return account
    }
    
    private func getValue(_ user: User) -> Double {
        bankView.valueRequest()
        
        guard let value = bankView.getInputAsDouble(),
              value.isValidValue(user.bankAccount.balance)
        else { return getValue(user) }
        
        return value
    }
    
}
