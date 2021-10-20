//
//  BankOperation.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

struct BankOperationComponent: BankOperationComponentProtocol {
    
    // MARK: - Attributes
    
    private let bankViewComponent: BankViewComponentProtocol
    private let userViewComponent: UserViewComponentProtocol
    
    // MARK: - Initializers (Constructors)
    init(userViewComponent: UserViewComponentProtocol, bankViewComponent: BankViewComponentProtocol) {
        self.userViewComponent = userViewComponent
        self.bankViewComponent = bankViewComponent
    }
    
    // MARK: - Methods
    
    func payment() {
        
        guard let user = getUser() else { return }
        
        let value = getValueToPay(user)
        
        var scenes = true
        
        while scenes {
            bankViewComponent.confirmDataPaymentDisplay()
            
            bankViewComponent.holderAccountDisplay(user.firstName, user.lastName, user.documentNumber, user.bankAccount.bank, user.bankAccount.branch, user.bankAccount.account, user.bankAccount.balance)
            
            bankViewComponent.paymentValueDisplay(value)
            bankViewComponent.confirmDataRequest()
            
            switch userViewComponent.getNavigation() {
            case 1:
                let newBalance = user.bankAccount.balance - value
                
                user.bankAccount.balance = newBalance
                
                db.save(user)
                
                bankViewComponent.successfullyMessageOfPaymentDisplay()
                bankViewComponent.currentBalanceDisplay(user.bankAccount.balance)
                userViewComponent.exitDisplay()
                scenes = false
            case 0:
                scenes = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
    func transfer(_ view: TransferView) {
        
        guard let user = getUser() else { return }
        
        let bank = getBank(view)
        let branch = getBranch(view)
        let account = getAccount(view)
        
        guard let payee = db.findPayee(bank, branch, account) else {
            print("Conta não encontrada, favor rever os dados.\n")
            userViewComponent.exitDisplay()
            return }
        
        let value = getValueToPay(user)
        
        var scenes = true
        
        while scenes {
            bankViewComponent.confirmDataTransferDisplay()
            
            bankViewComponent.holderAccountDisplay(user.firstName, user.lastName, user.documentNumber, user.bankAccount.bank, user.bankAccount.branch, user.bankAccount.account, user.bankAccount.balance)
            
            bankViewComponent.payeeAccountDisplay(payee.firstName, payee.lastName, payee.bankAccount.bank, payee.bankAccount.branch, payee.bankAccount.account)
            
            bankViewComponent.valueDisplay(value)
            bankViewComponent.confirmDataRequest()
            
            switch userViewComponent.getNavigation() {
            case 1:
                let newHolderBalance = user.bankAccount.balance - value
                let newPayeeBalance = payee.bankAccount.balance + value
                
                user.bankAccount.balance = newHolderBalance
                payee.bankAccount.balance = newPayeeBalance
                
                db.save(user)
                db.save(payee)
                
                bankViewComponent.successfullyMessageOfTransferDisplay()
                bankViewComponent.currentBalanceDisplay(user.bankAccount.balance)
                userViewComponent.exitDisplay()
                scenes = false
            case 0:
                scenes = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
    func readBankAccount(_ view: DisplayBankView) {
        guard let user = getUser() else { return }
        
        view.bank(user.bankAccount.bank)
        view.branch(user.bankAccount.branch)
        view.account(user.bankAccount.account)
        
        view.pix()
        for index in user.bankAccount.pix.indices {
            for (key,value) in user.bankAccount.pix[index] {
                guard let pix = value else { return }
                
                let keyValue = pixTypeToString(key)
                view.pixTypesAndValues(keyValue, pix)
            }
        }
        print()
    }
    
    func registerPixKey(_ type: PixType, _ view: PixKeyRegisterView) {
        
        if !checkPixKeyIsEmpty(type) {
            let typeValue = pixTypeToString(type)
            view.pixKeyAlreadyExists(typeValue)
        } else {
            guard let pixKey = registerPixKeyChoices(type) else { return }
            registerPix(type, pixKey)
            view.successfullyMessage()
        }
    }
    
    func deletePixKey(_ type: PixType, _ view: PixKeyDeleteView) {
        
        if !checkPixKeyIsEmpty(type) {
            
            var scenes = true
            
            while scenes {
                view.showMessage()
                
                switch userViewComponent.getNavigation() {
                case 1:
                    deletePix(type)
                    view.showSuccessfullyDeleted()
                    scenes = false
                case 0:
                    scenes = false
                default:
                    print("Por favor, escolha uma operação")
                }
            }
        } else {
            view.showNotExistMessage("CPF")
        }
    }
    
    func transferWithPix(_ type: PixType) {
        guard let user = getUser() else { return }
        
        guard let pixKey = transferPixKeyChoices(type) else { return }
        
        guard let payee = db.findPayeeByPixKey([type:pixKey]) else {
            print("Conta não encontrada, favor rever os dados.\n")
            userViewComponent.exitDisplay()
            return }
        
        let value = getValueToPay(user)
        
        var scenes = true
        
        while scenes {
            bankViewComponent.confirmDataTransferDisplay()
            
            bankViewComponent.holderAccountDisplay(user.firstName, user.lastName, user.documentNumber, user.bankAccount.bank, user.bankAccount.branch, user.bankAccount.account, user.bankAccount.balance)
            
            
            bankViewComponent.payeeAccountDisplay(payee.firstName, payee.lastName, payee.bankAccount.bank, payee.bankAccount.branch, payee.bankAccount.account)
            
            bankViewComponent.valueDisplay(value)
            bankViewComponent.confirmDataRequest()
            
            switch userViewComponent.getNavigation() {
            case 1:
                let newHolderBalance = user.bankAccount.balance - value
                let newPayeeBalance = payee.bankAccount.balance + value
                
                user.bankAccount.balance = newHolderBalance
                payee.bankAccount.balance = newPayeeBalance
                
                db.save(user)
                db.save(payee)
                
                bankViewComponent.successfullyMessageOfTransferDisplay()
                bankViewComponent.currentBalanceDisplay(user.bankAccount.balance)
                userViewComponent.exitDisplay()
                scenes = false
            case 0:
                scenes = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
    func createQRCodeWithPix(_ type: PixType, _ view: PixPaymentQRCodeView) {
        
        guard let pixKey = getQRCodeByPix(type) else {
            view.errorQRCodeMessage()
            return }
        
        let value = getValueForPayment()
        let code = generateQRCode(pixKey, value)
        
        view.showSuccessCreate()
        view.showCode(code)
    }
    
    func paymentWithPix(_ view: PixPaymentPayView) {
        guard let user = getUser() else { return }
        
        view.valueRequest()
        guard let code = userViewComponent.getInput() else { return }
        guard let qrCode = db.findQRCodeByCodeValue(code) else { return }
        guard let payee = db.findUserByQRCode(code) else { return paymentWithPix(view) }
        
        var scenes = true
        
        while scenes {
            bankViewComponent.confirmDataPaymentDisplay()
            
            bankViewComponent.holderAccountDisplay(user.firstName, user.lastName, user.documentNumber, user.bankAccount.bank, user.bankAccount.branch, user.bankAccount.account, user.bankAccount.balance)
            
            bankViewComponent.payeeAccountDisplay(payee.firstName, payee.lastName, payee.bankAccount.bank, payee.bankAccount.branch, payee.bankAccount.account)
            
            bankViewComponent.valueDisplay(qrCode.value)
            bankViewComponent.confirmDataRequest()
            
            switch userViewComponent.getNavigation() {
            case 1:
                if !qrCode.value.isValidValue(user.bankAccount.balance) {
                    userViewComponent.exitDisplay()
                    scenes = false
                } else {
                    let newHolderBalance = user.bankAccount.balance - qrCode.value
                    let newPayeeBalance = payee.bankAccount.balance + qrCode.value
                    
                    user.bankAccount.balance = newHolderBalance
                    payee.bankAccount.balance = newPayeeBalance
                    
                    db.save(user)
                    db.save(payee)
                    
                    bankViewComponent.successfullyMessageOfTransferDisplay()
                    bankViewComponent.currentBalanceDisplay(user.bankAccount.balance)
                    userViewComponent.exitDisplay()
                    scenes = false
                }
            case 0:
                scenes = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
    // MARK: - Assistants Methods
    
    /// Method responsible for extracting the user in the section
    ///
    /// - Returns: The user logged into the application
    private func getUser() -> User? {
        guard let user: User = session.user else { return nil }
        return user
    }
    
    /// Method responsible for sending the "Amount to pay or transfer" Request View, receiving the input and validating it
    ///
    /// - Parameter user: The user logged who will make the payment or transfer
    ///
    /// - Returns: The value to be withdrawn from the user logged into the application validated
    private func getValueToPay(_ user: User) -> Double {
        bankViewComponent.valueRequest()
        
        guard let value = bankViewComponent.getMoneyInput(),
              value.isValidValue(user.bankAccount.balance)
        else { return getValueToPay(user) }
        
        return value
    }
    
    // MARK: - Assistants Methods: Transfer
    
    /// Method responsible for sending the "Bank" Request View, receiving the input and validating it
    ///
    /// - Parameter view: The view for display the request
    ///
    /// - Returns: the payee's bank validated
    private func getBank(_ view: TransferView) -> String {
        view.transferBankRequest()
        
        guard let bank = userViewComponent.getInput() else { return getBank(view) }
        
        return bank
    }
    
    /// Method responsible for sending the "Branch" Request View, receiving the input and validating it
    ///
    /// - Parameter view: The view for display the request
    ///
    /// - Returns: the payee's branch validated
    private func getBranch(_ view: TransferView) -> Int {
        view.transferBranchRequest()
        
        guard let branch = bankViewComponent.getInputAsInt() else { return getBranch(view) }
        
        return branch
    }
    
    /// Method responsible for sending the "Account" Request View, receiving the input and validating it
    ///
    /// - Parameter view: The view for display the request
    ///
    /// - Returns: the payee's account validated
    private func getAccount(_ view: TransferView) -> Int {
        view.transferAccountRequest()
        
        guard let account = bankViewComponent.getInputAsInt() else { return getAccount(view) }
        
        return account
    }
    
    // MARK: - Assistants Methods: Register PIX Key
    
    /// Method responsible for sending "Document Number" Request View, receiving input and validating it
    ///
    /// This method checks if there is a document number with this value among the registered pix keys and refuses if it already exists
    ///
    ///  - Returns: A validated document number to be register as pix key
    private func getDocumentNumberPixKeyToRegister() -> String {
        bankViewComponent.documentNumberRequest()
        
        guard let documentNumber = userViewComponent.getInput(),
              documentNumber.notEmpty("'CPF'"), documentNumber.isValidCpf(),
              documentNumber.unique(.pixDocumentNumber)
        else { return getDocumentNumberPixKeyToRegister() }
        
        return documentNumber
    }
    
    /// Method responsible for sending "Email" Request View, receiving input and validating it
    ///
    /// This method checks if there is a email with this value among the registered pix keys and refuses if it already exists
    ///
    /// - Returns: A validated email to be register as pix key
    private func getEmailPixKeyToRegister() -> String {
        bankViewComponent.emailRequest()
        
        guard let email = userViewComponent.getInput(),
              email.notEmpty("'e-mail'"), email.isEmail, email.unique(.pixEmail)
        else { return getEmailPixKeyToRegister() }
        
        return email
    }
    
    /// Method responsible for sending "Phone Number" Request View, receiving input and validating it
    ///
    /// This method checks if there is a phone with this value among the registered pix keys and refuses if it already exists
    ///
    /// - Returns: A validated phone to be register as pix key
    private func getPhonePixKeyToRegister() -> String {
        bankViewComponent.phoneRequest()
        
        guard let phone = userViewComponent.getInput(),
              phone.notEmpty("'telefone'"), phone.isPhone, phone.unique(.pixPhone)
        else { return getPhonePixKeyToRegister() }
        
        return phone
    }
    
    /// Method responsible for Registering a PIX key
    ///
    /// - Parameter type: The type of the PIX key
    /// - Parameter value: The value of the PIX key
    private func registerPix(_ type: PixType, _ value: String) {
        
        guard let user = getUser() else { return }
        
        if type == .CPF {
            user.bankAccount.pix.append([PixType.CPF:value])
        } else if type == .email {
            user.bankAccount.pix.append([PixType.email:value])
        } else {
            user.bankAccount.pix.append([PixType.phoneNumber:value])
        }
        
        db.save(user)
    }
    
    /// Method responsible for Directing the PIX Key Registration request to its corresponding method
    ///
    /// - Parameter type: The chosen type of pix key
    ///
    /// - Returns: An optional of the validated value of the pix key type chosen to be registered
    private func registerPixKeyChoices(_ type: PixType) -> String? {
        let dicionary: [PixType:String] = [
            .CPF:getDocumentNumberPixKeyToRegister(),
            .email:getEmailPixKeyToRegister(),
            .phoneNumber:getPhonePixKeyToRegister()
        ]
        
        return dicionary[type] ?? nil
    }
    
    // MARK: - Assistants Methods: Delete PIX Key
    
    /// Method responsible for Deleting a PIX key
    ///
    /// - Parameter type: The type of the PIX key
    private func deletePix(_ type: PixType) {
        
        guard let user = getUser() else { return }
        
        for index in user.bankAccount.pix.indices {
            for (key,_) in user.bankAccount.pix[index] {
                if key == type {
                    user.bankAccount.pix.remove(at: index)
                }
            }
        }
    }
    
    // MARK: - Assistants Methods: Delete And Register PIX Key
    
    /// Method responsible for checking if there is a pix key in the field sent
    ///
    /// - Parameter pixType: The field to be checked
    ///
    /// - Returns: true for emptiness and false for non emptiness
    private func checkPixKeyIsEmpty(_ pixType: PixType) -> Bool {
        
        guard let user = getUser() else { return false}
        
        for index in user.bankAccount.pix.indices {
            for (key,value) in user.bankAccount.pix[index] {
                if key == pixType && value != String() {
                    return false
                }
            }
        }
        return true
    }
    
    // MARK: - Assistants Methods: PIX Transfer
    
    /// Method responsible for sending "PIX Type: Document Number" Request View to "Transfer", receiving input and validating it
    ///
    /// - Returns: A validated document number to use in a transfer
    private func getDocumentNumberPixKeyToTransfer() -> String {
        bankViewComponent.documentNumberRequest()
        
        guard let documentNumber = userViewComponent.getInput(),
              documentNumber.notEmpty("'CPF'"), documentNumber.isCPF
        else { return getDocumentNumberPixKeyToRegister() }
        
        return documentNumber
    }
    
    /// Method responsible for sending "PIX Type: Email" Request View to "Transfer", receiving input and validating it
    ///
    /// - Returns: A validated email to use in a transfer
    private func getEmailPixKeyToTransfer() -> String {
        bankViewComponent.emailRequest()
        
        guard let email = userViewComponent.getInput(),
              email.notEmpty("'e-mail'"), email.isEmail
        else { return getEmailPixKeyToRegister() }
        
        return email
    }
    
    /// Method responsible for sending "PIX Type: Phone Number" Request View to "Transfer", receiving input and validating it
    ///
    /// - Returns: A validated phone to use in a transfer
    private func getPhonePixKeyToTransfer() -> String {
        bankViewComponent.phoneRequest()
        
        guard let phone = userViewComponent.getInput(),
              phone.notEmpty("'telefone'"), phone.isPhone
        else { return getPhonePixKeyToRegister() }
        
        return phone
    }
    
    /// Method responsible for Directing the Transfer request by PIX key to its corresponding method
    ///
    /// - Parameter type: The chosen type of pix key
    ///
    /// - Returns: An optional of the validated value of the pix key type chosen to be used in a transfer
    private func transferPixKeyChoices(_ type: PixType) -> String? {
        
        let dicionary: [PixType:String] = [
            .CPF:getDocumentNumberPixKeyToTransfer(),
            .email:getEmailPixKeyToTransfer(),
            .phoneNumber:getPhonePixKeyToTransfer()
        ]
        
        return dicionary[type] ?? nil
    }
    
    // MARK: - Assistants Methods: Create QR Code
    
    /// Method responsible for finding the pix key by the chosen type
    ///
    /// - Parameter pixType: The chosen type of pix key
    ///
    /// - Returns: The PIX key corresponding to the chosen type
    private func getQRCodeByPix(_ pixType: PixType) -> [PixType:String]? {
        
        guard let user = getUser() else { return nil }
        
        for index in user.bankAccount.pix.indices {
            for (key,value) in user.bankAccount.pix[index] {
                if pixType == key && value != nil {
                    guard let pix = value else { return nil }
                    return [pixType:pix]
                }
            }
        }
        return nil
    }
    
    /// Method responsible for setting a payment value
    ///
    /// - Returns: The amount to be paid by someone
    private func getValueForPayment() -> Double {
        bankViewComponent.valueRequest()
        
        guard let value = bankViewComponent.getMoneyInput() else { return getValueForPayment() }
        
        return value
    }
    
    /// Method responsible for creating a QR Code
    ///
    /// - Parameter pixKey: Pix key to identify the payee
    /// - Parameter value: Payment amount
    ///
    /// - Returns: The code value of the QR Code
    private func generateQRCode(_ pixKey: [PixType:String], _ value: Double) -> String {
        
        let qrCode = QRCode(code: String().QRCodeGenerator, pix: pixKey, value: value)
        
        db.save(qrCode)
        
        return qrCode.code
    }
    
    // MARK: - Assistants Methods: Read and Register PIX Key
    
    /// Method responsible for converting the PIX Type to string and BR
    ///
    /// - Parameter pixType: The type of pix key to be converted
    ///
    /// - Returns: A string with PIX key type in BR
    private func pixTypeToString(_ pixType: PixType) -> String {
        
        if pixType == .CPF {
            return "CPF"
        }
        else if pixType == .email {
            return "E-mail"
        }
        else {
            return "Telefone"
        }
    }
    
}
