//
//  BankOperation.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

struct BankViewController: BankViewControllerProtocol {
    
    // MARK: - Attributes
    
    let bankView = BankView()
    let userView = UserView()
    
    // MARK: - Methods
    
    /* Common Payment */
    
    func payment(_ token: String) {
        guard let user = getUser(token) else { return }
        
        let value = getValueToPay(user)
        
        var loop = true
        
        while loop {
            bankView.confirmDataPayment()
            
            bankView.originAccount()
            bankView.holderAccount(user.firstName, user.lastName, user.documentNumber, user.bankAccount.bank, user.bankAccount.branch, user.bankAccount.account, user.bankAccount.balance)
            
            bankView.paymentValue(value)
            bankView.confirmDataRequest()
            
            switch userView.getNavigation() {
            case 1:
                let newBalance = user.bankAccount.balance - value
                user.bankAccount.balance = newBalance
                db.save(user)
                bankView.successfullyMessageOfPayment()
                bankView.currentBalance(user.bankAccount.balance)
                userView.exit()
                loop = false
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
    /* Common Transfer */
    
    func transfer(_ token: String) {
        guard let user = getUser(token) else { return }

        let bank = getBank()
        let branch = getBranch()
        let account = getAccount()
        
        if !db.findPayee(bank, branch, account).condition {
            print("Conta não encontrada, favor rever os dados.\n")
            userView.exit()
        }
        
        guard let payee = db.findPayee(bank, branch, account).user else { return }

        let value = getValueToPay(user)
        
        var loop = true
        
        while loop {
            bankView.confirmDataTransfer()
            
            bankView.originAccount()
            bankView.holderAccount(user.firstName, user.lastName, user.documentNumber, user.bankAccount.bank, user.bankAccount.branch, user.bankAccount.account, user.bankAccount.balance)

            bankView.destinationAccount()
            bankView.payeeAccount(payee.firstName, payee.lastName, payee.bankAccount.bank, payee.bankAccount.branch, payee.bankAccount.account)

            bankView.value(value)
            bankView.confirmDataRequest()
            
            switch userView.getNavigation() {
            case 1:
                let newHolderBalance = user.bankAccount.balance - value
                let newPayeeBalance = payee.bankAccount.balance + value
                
                user.bankAccount.balance = newHolderBalance
                payee.bankAccount.balance = newPayeeBalance
                
                db.save(user)
                db.save(payee)
                
                bankView.successfullyMessageOfTransfer()
                bankView.currentBalance(user.bankAccount.balance)
                userView.exit()
                loop = false
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
        
    }
    
    /* Display Account */
    
    func accountInfo(_ token: String) {
        guard let user = getUser(token) else { return }
        
        let scene = DisplayBankView()
        
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
    
    /* PIX - Register */
    
    func registerPixKeyOfDocumentNumber(_ token: String) {
        let scene = PixKeyRegisterView()
        
        if !checkDocumentNumberPixKeyIsEmpty(token) {
            scene.pixCpfAlreadyExists()
        } else {
            let documentNumber = getDocumentNumberPixKeyToRegister()
            registerPixKey(token, .CPF, documentNumber)
            scene.successfullyMessage()
        }
    }
    
    func registerPixKeyOfEmail(_ token: String) {
        let scene = PixKeyRegisterView()
        
        if !checkEmailPixKeyIsEmpty(token){
            scene.pixEmailAlreadyExists()
        } else {
            let email = getEmailPixKeyToRegister()
            registerPixKey(token, .email, email)
            scene.successfullyMessage()
        }
    }
    
    func registerPixKeyOfPhoneNumber(_ token: String) {
        let scene = PixKeyRegisterView()
        
        if !checkPhonePixKeyIsEmpty(token){
            scene.pixPhoneAlreadyExists()
        } else {
            let phone = getPhonePixKeyToRegister()
            registerPixKey(token, .phoneNumber, phone)
            scene.successfullyMessage()
        }
    }
    
    /* PIX - Delete */
    
    func deletePixKeyOfDocumentNumber(_ token: String) {
        let scene = PixKeyDeleteView()
    
        if !checkDocumentNumberPixKeyIsEmpty(token) {
            var option = true
            while option {
                scene.showMessage()
                switch userView.getNavigation() {
                case 1:
                    deleteDocumentNumberPixKey(token)
                    scene.showSuccessfullyDeleted()
                    option = false
                case 0:
                    option = false
                default:
                    print("Por favor, escolha uma operação")
                }
            }
        } else {
            scene.showNotExistMessage("CPF")
        }
    }
    
    func deletePixKeyOfEmail(_ token: String) {
        let scene = PixKeyDeleteView()
    
        if !checkEmailPixKeyIsEmpty(token) {
            var option = true
            while option {
                scene.showMessage()
                switch userView.getNavigation() {
                case 1:
                    deleteEmailPixKey(token)
                    scene.showSuccessfullyDeleted()
                    option = false
                case 0:
                    option = false
                default:
                    print("Por favor, escolha uma operação")
                }
            }
        } else {
            scene.showNotExistMessage("E-mail")
        }
    }
    
    func deletePixKeyOfPhoneNumber(_ token: String) {
        let scene = PixKeyDeleteView()
    
        if !checkPhonePixKeyIsEmpty(token) {
            var option = true
            while option {
                scene.showMessage()
                switch userView.getNavigation() {
                case 1:
                    deletePhonePixKey(token)
                    scene.showSuccessfullyDeleted()
                    option = false
                case 0:
                    option = false
                default:
                    print("Por favor, escolha uma operação")
                }
            }
        } else {
            scene.showNotExistMessage("Telefone")
        }
    }
    
    /* PIX - Transfer */
    
    func transferPixKeyOfDocumentNumber(_ token: String) {
        guard let user = getUser(token) else { return }

        let documentNumber = getDocumentNumberPixKeyToTransfer()
        
        if !db.findPayeeByDocumentNumberPixKey(documentNumber).condition {
            print("Conta não encontrada, favor rever os dados.\n")
            userView.exit()
        }
        
        guard let payee = db.findPayeeByDocumentNumberPixKey(documentNumber).user else { return }
        
        let value = getValueToPay(user)
        
        var loop = true
        
        while loop {
            bankView.confirmDataTransfer()
 
            bankView.originAccount()
            bankView.holderAccount(user.firstName, user.lastName, user.documentNumber, user.bankAccount.bank, user.bankAccount.branch, user.bankAccount.account, user.bankAccount.balance)

            bankView.destinationAccount()
            bankView.payeeAccount(payee.firstName, payee.lastName, payee.bankAccount.bank, payee.bankAccount.branch, payee.bankAccount.account)

            bankView.value(value)
            bankView.confirmDataRequest()
            
            switch userView.getNavigation() {
            case 1:
                let newHolderBalance = user.bankAccount.balance - value
                let newPayeeBalance = payee.bankAccount.balance + value
                
                user.bankAccount.balance = newHolderBalance
                payee.bankAccount.balance = newPayeeBalance
                
                db.save(user)
                db.save(payee)
                
                bankView.successfullyMessageOfTransfer()
                bankView.currentBalance(user.bankAccount.balance)
                userView.exit()
                loop = false
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
    func transferPixKeyOfEmail(_ token: String) {
        guard let user = getUser(token) else { return }

        let email = getEmailPixKeyToTransfer()
        
        if !db.findPayeeByEmailPixKey(email).condition {
            print("Conta não encontrada, favor rever os dados.\n")
            userView.exit()
        }
        
        guard let payee = db.findPayeeByEmailPixKey(email).user else { return }
        
        let value = getValueToPay(user)

        var loop = true
        
        while loop {
            bankView.confirmDataTransfer()

            bankView.originAccount()
            bankView.holderAccount(user.firstName, user.lastName, user.documentNumber, user.bankAccount.bank, user.bankAccount.branch, user.bankAccount.account, user.bankAccount.balance)

            bankView.destinationAccount()
            bankView.payeeAccount(payee.firstName, payee.lastName, payee.bankAccount.bank, payee.bankAccount.branch, payee.bankAccount.account)

            bankView.value(value)
            bankView.confirmDataRequest()
            
            switch userView.getNavigation() {
            case 1:
                let newHolderBalance = user.bankAccount.balance - value
                let newPayeeBalance = payee.bankAccount.balance + value
                
                user.bankAccount.balance = newHolderBalance
                payee.bankAccount.balance = newPayeeBalance
                
                db.save(user)
                db.save(payee)
                
                bankView.successfullyMessageOfTransfer()
                bankView.currentBalance(user.bankAccount.balance)
                userView.exit()
                loop = false
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }

    func transferPixKeyOfPhoneNumber(_ token: String) {
        guard let user = getUser(token) else { return }

        let phoneNumber = getPhonePixKeyToTransfer()
        
        if !db.findPayeeByPhonePixKey(phoneNumber).condition {
            print("Conta não encontrada, favor rever os dados.\n")
            userView.exit()
        }
        
        guard let payee = db.findPayeeByPhonePixKey(phoneNumber).user else { return }
        
        let value = getValueToPay(user)

        var loop = true
        
        while loop {
            bankView.confirmDataTransfer()

            bankView.originAccount()
            bankView.holderAccount(user.firstName, user.lastName, user.documentNumber, user.bankAccount.bank, user.bankAccount.branch, user.bankAccount.account, user.bankAccount.balance)

            bankView.destinationAccount()
            bankView.payeeAccount(payee.firstName, payee.lastName, payee.bankAccount.bank, payee.bankAccount.branch, payee.bankAccount.account)

            bankView.value(value)
            bankView.confirmDataRequest()
            
            switch userView.getNavigation() {
            case 1:
                let newHolderBalance = user.bankAccount.balance - value
                let newPayeeBalance = payee.bankAccount.balance + value
                
                user.bankAccount.balance = newHolderBalance
                payee.bankAccount.balance = newPayeeBalance
                
                db.save(user)
                db.save(payee)
                
                bankView.successfullyMessageOfTransfer()
                bankView.currentBalance(user.bankAccount.balance)
                userView.exit()
                loop = false
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
    /* PIX - QR Code */
    
    func QRCodePixKeyOfDocumentNumber(_ token: String) {
        let scene = PixPaymentQRCodeView()
        
        if getQRCodeByDocumentNumber(token).condition {
            let pixKey = getQRCodeByDocumentNumber(token).pixKey
            let value = getValueForPayment()
            let code = generateQRCode(pixKey, value)
            
            scene.showSuccessCreate()
            scene.showCode(code)
        } else {
            scene.errorQRCodeMessage()
        }
    }
    
    func QRCodePixKeyOfEmail(_ token: String) {
        let scene = PixPaymentQRCodeView()
        
        if getQRCodeByEmail(token).condition {
            let pixKey = getQRCodeByEmail(token).pixKey
            let value = getValueForPayment()
            let code = generateQRCode(pixKey, value)
            
            scene.showSuccessCreate()
            scene.showCode(code)
        } else {
            scene.errorQRCodeMessage()
        }
    }
    
    func QRCodePixKeyOfPhoneNumber(_ token: String) {
        let scene = PixPaymentQRCodeView()
        
        if getQRCodeByPhone(token).condition {
            let pixKey = getQRCodeByPhone(token).pixKey
            let value = getValueForPayment()
            let code = generateQRCode(pixKey, value)
            
            scene.showSuccessCreate()
            scene.showCode(code)
        } else {
            scene.errorQRCodeMessage()
        }
    }
    
    /* PIX - Payment */
    
    func paymentPixKey(_ token: String) {
        guard let user = getUser(token) else { return }

        PixPaymentPayView().valueRequest()
        guard let code = userView.getInput() else { return }
        guard let qrCode = db.findQRCodeByCode(code) else { return }
        guard let payee = db.findUserByQRCode(code) else { return paymentPixKey(token) }
        
        var loop = true
        
        while loop {
            bankView.confirmDataPayment()

            bankView.originAccount()
            bankView.holderAccount(user.firstName, user.lastName, user.documentNumber, user.bankAccount.bank, user.bankAccount.branch, user.bankAccount.account, user.bankAccount.balance)
            
            bankView.destinationAccount()
            bankView.payeeAccount(payee.firstName, payee.lastName, payee.bankAccount.bank, payee.bankAccount.branch, payee.bankAccount.account)

            bankView.value(qrCode.value)
            bankView.confirmDataRequest()
            
            switch userView.getNavigation() {
            case 1:
                if !qrCode.value.isValidValue(user.bankAccount.balance) {
                    userView.exit()
                    loop = false
                } else {
                    let newHolderBalance = user.bankAccount.balance - qrCode.value
                    let newPayeeBalance = payee.bankAccount.balance + qrCode.value
                    
                    user.bankAccount.balance = newHolderBalance
                    payee.bankAccount.balance = newPayeeBalance
                    
                    db.save(user)
                    db.save(payee)
                    
                    bankView.successfullyMessageOfTransfer()
                    bankView.currentBalance(user.bankAccount.balance)
                    userView.exit()
                    loop = false
                }
            case 0:
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
    
    private func getValueToPay(_ user: User) -> Double {
        bankView.valueRequest()
        guard let value = bankView.getInputAsDouble(),
              value.isValidValue(user.bankAccount.balance)
        else { return getValueToPay(user) }
        return value
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
    
    private func checkDocumentNumberPixKeyIsEmpty(_ token: String) -> Bool {
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
    
    private func checkEmailPixKeyIsEmpty(_ token: String) -> Bool {
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
    
    private func checkPhonePixKeyIsEmpty(_ token: String) -> Bool {
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
    
    private func getDocumentNumberPixKeyToRegister() -> String {
        bankView.cpfRequest()
        guard let documentNumber = userView.getInput(),
              documentNumber.notEmpty("'CPF'"), documentNumber.isValidCpf(),
              documentNumber.unique(.pixDocumentNumber)
        else { return getDocumentNumberPixKeyToRegister() }
        return documentNumber
    }
    
    private func getEmailPixKeyToRegister() -> String {
        bankView.emailRequest()
        guard let email = userView.getInput(),
              email.notEmpty("'e-mail'"), email.isEmail, email.unique(.pixEmail)
        else { return getEmailPixKeyToRegister() }
        return email
    }
    
    private func getPhonePixKeyToRegister() -> String {
        bankView.phoneRequest()
        guard let phone = userView.getInput(),
              phone.notEmpty("'telefone'"), phone.isPhone, phone.unique(.pixPhone)
        else { return getPhonePixKeyToRegister() }
        return phone
    }
    
    private func registerPixKey(_ token: String, _ type: PixType, _ pixKey: String) {
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
    
    private func deleteDocumentNumberPixKey(_ token: String) {
        guard let user = getUser(token) else { return }
        for index in user.bankAccount.pix.indices {
            for (key,_) in user.bankAccount.pix[index] {
                if key == .CPF {
                    user.bankAccount.pix.remove(at: index)
                }
            }
        }
    }
    
    private func deleteEmailPixKey(_ token: String) {
        guard let user = getUser(token) else { return }
        for index in user.bankAccount.pix.indices {
            for (key,_) in user.bankAccount.pix[index] {
                if key == .email {
                    user.bankAccount.pix.remove(at: index)
                }
            }
        }
    }
    
    private func deletePhonePixKey(_ token: String) {
        guard let user = getUser(token) else { return }
        for index in user.bankAccount.pix.indices {
            for (key,_) in user.bankAccount.pix[index] {
                if key == .phoneNumber {
                    user.bankAccount.pix.remove(at: index)
                }
            }
        }
    }
    
    private func getDocumentNumberPixKeyToTransfer() -> String {
        bankView.cpfRequest()
        guard let documentNumber = userView.getInput(),
              documentNumber.notEmpty("'CPF'"), documentNumber.isCPF
        else { return getDocumentNumberPixKeyToRegister() }
        return documentNumber
    }
    
    private func getEmailPixKeyToTransfer() -> String {
        bankView.emailRequest()
        guard let email = userView.getInput(),
              email.notEmpty("'e-mail'"), email.isEmail
        else { return getEmailPixKeyToRegister() }
        return email
    }
    
    private func getPhonePixKeyToTransfer() -> String {
        bankView.phoneRequest()
        guard let phone = userView.getInput(),
              phone.notEmpty("'telefone'"), phone.isPhone
        else { return getPhonePixKeyToRegister() }
        return phone
    }
    
    private func getQRCodeByDocumentNumber(_ token: String) -> (condition: Bool, pixKey: String) {
        guard let user = getUser(token) else { return (false, String()) }
        
        for index in user.bankAccount.pix.indices {
            for (key,value) in user.bankAccount.pix[index] {
                if key == .CPF {
                    return (true, value)
                }
            }
        }
        return (false, String())
    }
    
    private func getQRCodeByEmail(_ token: String) -> (condition: Bool, pixKey: String) {
        guard let user = getUser(token) else { return (false, String()) }
        
        for index in user.bankAccount.pix.indices {
            for (key,value) in user.bankAccount.pix[index] {
                if key == .email {
                    return (true, value)
                }
            }
        }
        return (false, String())
    }
    
    private func getQRCodeByPhone(_ token: String) -> (condition: Bool, pixKey: String) {
        guard let user = getUser(token) else { return (false, String()) }
        
        for index in user.bankAccount.pix.indices {
            for (key,value) in user.bankAccount.pix[index] {
                if key == .phoneNumber {
                    return (true, value)
                }
            }
        }
        return (false, String())
    }
    
    private func getValueForPayment() -> Double {
        bankView.valueRequest()
        guard let value = bankView.getInputAsDouble()
        else { return getValueForPayment() }
        return value
    }
    
    private func generateQRCode(_ pixKey: String, _ value: Double) -> String {
        let qrCode = QRCode(code: String().QRCodeGenerator, pix: pixKey, value: value)
        db.save(qrCode)
        return qrCode.code
    }

}
