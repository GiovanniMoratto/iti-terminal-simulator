//
//  Database.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

class Database {
    
    // MARK: - Attributes
    
    var users: [User] = []
    var QRCodes: [QRCode] = []
    
    static var shared = Database()
    
    // MARK: - Initializers (Constructors)
    
    private init() {}
        
    // MARK: - Methods: SAVE
    
    /// Method responsible for persisting a user in the user database
    ///
    /// - Parameter user: The user to be persisted
    func save(_ user: User) {
        db.users.append(user)
    }
    
    /// Method responsible for persisting a QR Code in the QR Code database
    ///
    /// - Parameter qrCode: The QR Code to be persisted
    func save(_ qrCode: QRCode) {
        db.QRCodes.append(qrCode)
    }
    
    // MARK: - Methods: DELETE
    
    /// Method responsible for remove a user from the user database
    func delete() {
        
        guard let user: User = session.user else { return }
        
        guard let index = db.users.firstIndex(where: { $0.documentNumber == user.documentNumber }) else { return }
        db.users.remove(at: index)
    }
    
    // MARK: - Methods: FIND
    
    /// Method responsible for finding a user in the user database by document number
    ///
    /// - Parameter documentNumber: The document number that will be used in the search
    ///
    /// - Returns: An Optional of the User found
    func findUserByDocumentNumber(_ documentNumber: String) -> User? {
        
        guard let index = db.users.firstIndex(where: { $0.documentNumber == documentNumber }) else { return nil }
        
        return db.users[index]
    }
    
    /// Method responsible for finding a user in the user database by bank, branch and account
    ///
    /// - Parameter bank: The bank that will be used in the search
    /// - Parameter branch: The branch that will be used in the search
    /// - Parameter account: The account that will be used in the search
    ///
    /// - Returns: An Optional of the User found
    func findPayee(_ bank: String, _ branch: Int, _ account: Int) -> User? {
        
        guard let index = db.users.firstIndex(where: {
            $0.bankAccount.bank == bank && $0.bankAccount.branch == branch && $0.bankAccount.account == account
        }) else { return nil }
        
        return db.users[index]
    }
    
    /// Method responsible for finding a user in the user database by the PIX key
    ///
    /// - Parameter pixKey: The PIX key that will be used in the search
    ///
    /// - Returns: An Optional of the User found
    func findPayeeByPixKey(_ pixKey: [PixType:String]) -> User? {
        
        for userIndex in db.users.indices {
            for pixIndex in db.users[userIndex].bankAccount.pix.indices {
                for (_,_) in db.users[userIndex].bankAccount.pix[pixIndex] {
                    if db.users[userIndex].bankAccount.pix[pixIndex] == pixKey {
                        return db.users[userIndex]
                    }
                }
            }
        }
        return nil
    }
    
    /// Method responsible for finding a QR Code in the QR Code database by code value
    ///
    /// - Parameter codeValue: The code value that will be used in the search
    ///
    /// - Returns: An Optional of the QR Code found
    func findQRCodeByCodeValue(_ codeValue: String) -> QRCode? {
        
        guard let index = db.QRCodes.firstIndex(where: { $0.code == codeValue }) else { return nil }
        return db.QRCodes[index]
    }
    
    /// Method responsible for finding a user in the user database by QR Code value
    ///
    /// - Parameter codeValue: The code value that will be used in the search
    ///
    /// - Returns: An Optional of the User found
    func findUserByQRCode(_ codeValue: String) -> User? {
        
        guard let qrCode = findQRCodeByCodeValue(codeValue) else { return nil }
        
        if findPayeeByPixKey(qrCode.pix) != nil {
            return findPayeeByPixKey(qrCode.pix)
        }
        else {
            print("QR Code incorreto ou inexistente")
            return nil
        }
    }
    
}
