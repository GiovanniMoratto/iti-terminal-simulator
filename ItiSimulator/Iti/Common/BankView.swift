//
//  BankView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

struct BankView: BankViewProtocol {
    
    // MARK: - Methods
    
    func holderAccount(_ firstName: String, _ lastName: String, _ documentNumber: String, _ bank: String, _ branch: Int, _ account: Int, _ balance: Double) {
        print("Nome:        \(firstName) \(lastName)")
        print("CPF:         \(documentNumber)")
        print("Banco:       \(bank)")
        print("Agência:     \(branch)")
        print("Conta:       \(account)")
        print("Saldo:    R$ \(balance)\n")
    }
    
    func getInputAsDouble() -> Double? {
        guard let input = readLine() else { return Double()}
        
        let bankInput = Double(input)
        print()
        
        return bankInput
    }
        
    func getInputAsInt() -> Int? {
        guard let input = readLine() else { return Int()}
        
        let bankInput = Int(input)
        print()
        
        return bankInput
    }

    func currentBalance(_ balance: Double) {
        print("Saldo atual: R$\(balance)\n")
    }
    
    func payeeAccount(_ firstName: String, _ lastName: String, _ bank: String, _ branch: Int, _ account: Int) {
        print("Nome:        \(firstName) \(lastName)")
        print("Banco:       \(bank)")
        print("Agência:     \(branch)")
        print("Conta:       \(account)\n")
    }
    
    func confirmDataRequest() {
        print("(1) - OK")
        print("(0) - Voltar\n")
    }
    
    func value(_ value: Double) {
        print("Valor: R$ \(value)\n")
    }
    
    func originAccount() {
        print("Conta de origem: ")
    }
    
    func destinationAccount() {
        print("Conta de destino: ")
    }
    
    func valueRequest() {
        print("Digite o valor: ")
    }
    
}
