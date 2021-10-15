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
    var credentials: [UserAccess] = []
    var QRCodes: [QRCode] = []
    static var shared = Database()
    
    // MARK: - Initializers (Constructors)
    
    private init() {}
    
    // MARK: - Methods
    
    /* Save */
    
    func save(_ user: User) {
        db.users.append(user)
    }
    
    func save(_ access: UserAccess) {
        db.credentials.append(access)
    }
    
    func save(_ code: QRCode) {
        db.QRCodes.append(code)
    }
    
    /* Find */
    
    func findUserByDocumentNumber(_ documentNumber: String) -> User? {
        guard let index = db.users.firstIndex(where: { $0.documentNumber == documentNumber }) else { return nil }
        return db.users[index]
    }
    
    func findUserByToken(_ token: String) -> User? {
        guard let index = db.credentials.firstIndex(where: { $0.token == token }) else { return nil }
        return db.credentials[index].user
    }
    
    func findPayee(_ bank: String, _ branch: Int, _ account: Int) -> (condition: Bool, user: User?){
        guard let index = db.users.firstIndex(where: {
            $0.bankAccount.bank == bank && $0.bankAccount.branch == branch && $0.bankAccount.account == account
        }) else { return (false, nil) }
        return (true, db.users[index])
    }
    
    func findPayeeByDocumentNumberPixKey(_ pixKey: String) -> (condition: Bool, user: User?) {
        for userIndex in db.users.indices {
            for pixIndex in db.users[userIndex].bankAccount.pix.indices {
                for (_,_) in db.users[userIndex].bankAccount.pix[pixIndex] {
                    if db.users[userIndex].bankAccount.pix[pixIndex] == [PixType.CPF:pixKey] {
                        return (true, db.users[userIndex])
                    }
                }
            }
        }
        return (false, nil)
    }
    
    func findPayeeByEmailPixKey(_ pixKey: String) -> (condition: Bool, user: User?) {
        for userIndex in db.users.indices {
            for pixIndex in db.users[userIndex].bankAccount.pix.indices {
                for (_,_) in db.users[userIndex].bankAccount.pix[pixIndex] {
                    if db.users[userIndex].bankAccount.pix[pixIndex] == [PixType.email:pixKey] {
                        return (true, db.users[userIndex])
                    }
                }
            }
        }
        return (false, nil)
    }
    
    func findPayeeByPhonePixKey(_ pixKey: String) -> (condition: Bool, user: User?) {
        for userIndex in db.users.indices {
            for pixIndex in db.users[userIndex].bankAccount.pix.indices {
                for (_,_) in db.users[userIndex].bankAccount.pix[pixIndex] {
                    if db.users[userIndex].bankAccount.pix[pixIndex] == [PixType.phoneNumber:pixKey] {
                        return (true, db.users[userIndex])
                    }
                }
            }
        }
        return (false, nil)
    }
    
    func findQRCodeByCode(_ code: String) -> QRCode? {
        guard let index = db.QRCodes.firstIndex(where: { $0.code == code }) else { return nil }
        return db.QRCodes[index]
    }
    
    func findUserByQRCode(_ code: String) -> User? {
        guard let qrCode = findQRCodeByCode(code) else { return nil }
        
        if findPayeeByDocumentNumberPixKey(qrCode.pix).condition {
            return findPayeeByDocumentNumberPixKey(qrCode.pix).user
        }
        else if findPayeeByEmailPixKey(qrCode.pix).condition {
            return findPayeeByEmailPixKey(qrCode.pix).user
        }
        else if findPayeeByPhonePixKey(qrCode.pix).condition {
            return findPayeeByPhonePixKey(qrCode.pix).user
        }
        else {
            print("QR Code incorreto ou inexistente")
            return nil
        }
    }
    
    /* Delete */
    
    func delete(_ token: String) {
        guard let user = db.findUserByToken(token) else { return }
        guard let index = db.users.firstIndex(where: { $0.documentNumber == user.documentNumber }) else { return }
        db.users.remove(at: index)
    }
    
}
