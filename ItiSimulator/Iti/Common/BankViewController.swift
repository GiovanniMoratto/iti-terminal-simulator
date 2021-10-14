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
        guard let user = getUser(token) else { return }
        
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
            bankView.confirmDataTransfer()
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
                
                bankView.successfullyMessage()
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
    
    func pixTransferDocumentNumber(_ token: String) {
        // Identifica usuário
        guard let user = getUser(token) else { return }
        
        // Exibe informções do Titular
        bankView.originAccount()
        bankView.holderAccount(user.firstName, user.lastName, user.documentNumber, user.bankAccount.bank, user.bankAccount.branch, user.bankAccount.account, user.bankAccount.balance)
                
        let documentNumber = getDocumentNumberPixKeyToTransfer()
        
        if !db.findPayeeByDocumentNumberPixKey(documentNumber).condition {
            print("Conta não encontrada, favor rever os dados.\n")
            userView.exit()
        }
        
        guard let payee = db.findPayeeByDocumentNumberPixKey(documentNumber).user else { return }
        
        bankView.destinationAccount()
        bankView.payeeAccount(payee.firstName, payee.lastName, payee.bankAccount.bank, payee.bankAccount.branch, payee.bankAccount.account)
        
        // Rebebe input e valida
        let value = getValue(user)
        
        //Confirmação
        var loop = true
        
        while loop {
            // Exibe mensagem de confimarção
            bankView.confirmDataTransfer()
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
                
                bankView.successfullyMessage()
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
    
    func pixTransferEmail(_ token: String) {
        // Identifica usuário
        guard let user = getUser(token) else { return }
        
        // Exibe informções do Titular
        bankView.originAccount()
        bankView.holderAccount(user.firstName, user.lastName, user.documentNumber, user.bankAccount.bank, user.bankAccount.branch, user.bankAccount.account, user.bankAccount.balance)
                
        let email = getEmailPixKeyToTransfer()
        
        if !db.findPayeeByEmailPixKey(email).condition {
            print("Conta não encontrada, favor rever os dados.\n")
            userView.exit()
        }
        
        guard let payee = db.findPayeeByEmailPixKey(email).user else { return }
        
        bankView.destinationAccount()
        bankView.payeeAccount(payee.firstName, payee.lastName, payee.bankAccount.bank, payee.bankAccount.branch, payee.bankAccount.account)
        
        // Rebebe input e valida
        let value = getValue(user)
        
        //Confirmação
        var loop = true
        
        while loop {
            // Exibe mensagem de confimarção
            bankView.confirmDataTransfer()
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
                
                bankView.successfullyMessage()
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
    
    func pixTransferPhone(_ token: String) {
        // Identifica usuário
        guard let user = getUser(token) else { return }
        
        // Exibe informções do Titular
        bankView.originAccount()
        bankView.holderAccount(user.firstName, user.lastName, user.documentNumber, user.bankAccount.bank, user.bankAccount.branch, user.bankAccount.account, user.bankAccount.balance)
                
        // Receber input do usuário
        let phoneNumber = getPhonePixKeyToTransfer()
        
        if !db.findPayeeByPhonePixKey(phoneNumber).condition {
            print("Conta não encontrada, favor rever os dados.\n")
            userView.exit()
        }
        
        guard let payee = db.findPayeeByPhonePixKey(phoneNumber).user else { return }
        
        bankView.destinationAccount()
        bankView.payeeAccount(payee.firstName, payee.lastName, payee.bankAccount.bank, payee.bankAccount.branch, payee.bankAccount.account)
        
        // Rebebe input e valida
        let value = getValue(user)
        
        //Confirmação
        var loop = true
        
        while loop {
            // Exibe mensagem de confimarção
            bankView.confirmDataTransfer()
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
                
                bankView.successfullyMessage()
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
    
    func accountInfo(_ token: String) {
        // Identifica usuário
        guard let user = getUser(token) else { return }
        
        // Instância a view de pagamento
        let scene = InsertMoneyView()
        
        scene.bank(user.bankAccount.bank)
        scene.branch(user.bankAccount.branch)
        scene.account(user.bankAccount.account)
        
        scene.pix()
        for index in user.bankAccount.pix.indices {
            for (key,value) in user.bankAccount.pix[index] {
                if key == PixType.CPF {
                    scene.pixTypesAndValues("CPF", value)
                }
                if key == PixType.email {
                    scene.pixTypesAndValues("E-mail", value)
                }
                if key == PixType.phoneNumber {
                    scene.pixTypesAndValues("Telefone", value)
                }
            }
        }
        print()
    }
    
    func checkDocumentNumberPixKeyIsEmpty(_ token: String) -> Bool {
        guard let user = getUser(token) else { return false}
        
        for index in user.bankAccount.pix.indices {
            for (key,value) in user.bankAccount.pix[index] {
                if key == .CPF && value != String() {
                    return false
                }
            }
        }
        return true
    }
    
    func checkEmailPixKeyIsEmpty(_ token: String) -> Bool {
        guard let user = getUser(token) else { return false}
        
        for index in user.bankAccount.pix.indices {
            for (key,value) in user.bankAccount.pix[index] {
                if key == .email && value != String() {
                    return false
                }
            }
        }
        return true
    }
    
    func checkPhonePixKeyIsEmpty(_ token: String) -> Bool {
        guard let user = getUser(token) else { return false}
        
        for index in user.bankAccount.pix.indices {
            for (key,value) in user.bankAccount.pix[index] {
                if key == .phoneNumber && value != String() {
                    return false
                }
            }
        }
        return true
    }
    
    func getDocumentNumberPixKeyToRegister() -> String {
        bankView.cpfRequest()
        guard let documentNumber = userView.getInput(),
              documentNumber.notEmpty("'CPF'"), documentNumber.isValidCpf(),
              documentNumber.unique(.pixDocumentNumber)
        else { return getDocumentNumberPixKeyToRegister() }
        
        return documentNumber
    }
    
    func getEmailPixKeyToRegister() -> String {
        bankView.emailRequest()
        guard let email = userView.getInput(),
              email.notEmpty("'e-mail'"), email.isEmail, email.unique(.pixEmail)
        else { return getEmailPixKeyToRegister() }
        
        return email
    }
    
    func getPhonePixKeyToRegister() -> String {
        bankView.phoneRequest()
        guard let phone = userView.getInput(),
              phone.notEmpty("'telefone'"), phone.isPhone, phone.unique(.pixPhone)
        else { return getPhonePixKeyToRegister() }
        
        return phone
    }
    
    func registerPixKey(_ token: String, _ type: PixType, _ pixKey: String) {
        guard let user = getUser(token) else { return }
        
        if type == .CPF {
            user.bankAccount.pix.append([PixType.CPF:pixKey])
        } else if type == .email {
            user.bankAccount.pix.append([PixType.email:pixKey])
        } else {
            user.bankAccount.pix.append([PixType.phoneNumber:pixKey])
        }
        db.save(user)
    }
    
    func deleteDocumentNumberPixKey(_ token: String) {
        guard let user = getUser(token) else { return }
        
        for index in user.bankAccount.pix.indices {
            for (key,_) in user.bankAccount.pix[index] {
                if key == .CPF {
                    user.bankAccount.pix.remove(at: index)
                }
            }
        }
    }
    
    func deleteEmailPixKey(_ token: String) {
        guard let user = getUser(token) else { return }
        
        for index in user.bankAccount.pix.indices {
            for (key,_) in user.bankAccount.pix[index] {
                if key == .email {
                    user.bankAccount.pix.remove(at: index)
                }
            }
        }
    }
    
    func deletePhonePixKey(_ token: String) {
        guard let user = getUser(token) else { return }
        
        for index in user.bankAccount.pix.indices {
            for (key,_) in user.bankAccount.pix[index] {
                if key == .phoneNumber {
                    user.bankAccount.pix.remove(at: index)
                }
            }
        }
    }
    
    func getDocumentNumberPixKeyToTransfer() -> String {
        bankView.cpfRequest()
        guard let documentNumber = userView.getInput(),
              documentNumber.notEmpty("'CPF'"), documentNumber.isCPF
        else { return getDocumentNumberPixKeyToRegister() }
        
        return documentNumber
    }
    
    func getEmailPixKeyToTransfer() -> String {
        bankView.emailRequest()
        guard let email = userView.getInput(),
              email.notEmpty("'e-mail'"), email.isEmail
        else { return getEmailPixKeyToRegister() }
        
        return email
    }
    
    func getPhonePixKeyToTransfer() -> String {
        bankView.phoneRequest()
        guard let phone = userView.getInput(),
              phone.notEmpty("'telefone'"), phone.isPhone
        else { return getPhonePixKeyToRegister() }
        
        return phone
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
