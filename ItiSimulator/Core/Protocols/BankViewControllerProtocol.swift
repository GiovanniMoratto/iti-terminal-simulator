//
//  BankOperationProtocol.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

protocol BankViewControllerProtocol {
    
    func payment(_ token: String)
    
    func transfer(_ token: String)
    
    func deposit(_ token: String)
    
    func accountInfo(_ token: String)
    
    func getDocumentNumberPixKey() -> String
    
    func getEmailPixKey() -> String
    
    func getPhonePixKey() -> String
    
    func registerPixKey(_ token: String, _ type: PixType, _ pixKey: String)
    
    func checkDocumentNumberPixKeyIsEmpty(_ token: String) -> Bool
    
    func checkEmailPixKeyIsEmpty(_ token: String) -> Bool
    
    func checkPhonePixKeyIsEmpty(_ token: String) -> Bool
    
    func deleteDocumentNumberPixKey(_ token: String)
    
    func deleteEmailPixKey(_ token: String)
    
    func deletePhonePixKey(_ token: String)
    
}