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
    
    // MARK: - Methods
    
    /* Save */
    
    func save(_ user: User) {
        db.users.append(user)
    }
    
    func save(_ code: QRCode) {
        db.QRCodes.append(code)
    }
    
    /* Find */
    
    func findUserByDocumentNumber(_ documentNumber: String) -> User? {
        guard let index = db.users.firstIndex(where: { $0.documentNumber == documentNumber }) else { return nil }
        return db.users[index]
    }
    
    func findPayee(_ bank: String, _ branch: Int, _ account: Int) -> User? {
        guard let index = db.users.firstIndex(where: {
            $0.bankAccount.bank == bank && $0.bankAccount.branch == branch && $0.bankAccount.account == account
        }) else { return nil }
        return db.users[index]
    }
    
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
    
    func findQRCodeByCode(_ code: String) -> QRCode? {
        guard let index = db.QRCodes.firstIndex(where: { $0.code == code }) else { return nil }
        return db.QRCodes[index]
    }
    
    func findUserByQRCode(_ code: String) -> User? {
        guard let qrCode = findQRCodeByCode(code) else { return nil }
        
        if findPayeeByPixKey(qrCode.pix) != nil {
            return findPayeeByPixKey(qrCode.pix)
        }
        else {
            print("QR Code incorreto ou inexistente")
            return nil
        }
    }
    
    /* Delete */
    
    func delete() {
        guard let user: User = session.user else { return }
        guard let index = db.users.firstIndex(where: { $0.documentNumber == user.documentNumber }) else { return }
        db.users.remove(at: index)
    }
    
}
