//
//  BankView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

struct BankViewComponent: BankViewComponentProtocol {
    
    // MARK: - Methods: Input Request Labels Messages
    
    func valueRequest() {
        print("Digite o valor: ")
    }
    
    func documentNumberRequest() {
        print("Digite o CPF: ")
    }
    
    func emailRequest() {
        print("Digite o e-mail: ")
    }
    
    func phoneRequest() {
        print("Digite o telefone: ")
    }
    
    func confirmDataRequest() {
        print("(1) - OK")
        print("(0) - Cancelar\n")
    }
    
    // MARK: - Methods: Receive Input
    
    func getMoneyInput() -> Double? {
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
    
    // MARK: - Methods: Show Information Labels Messages
    
    func confirmDataPaymentDisplay() {
        print("\n         Confirme os dados do Pagamento\n")
    }
    
    func confirmDataTransferDisplay() {
        print("\n         Confirme os dados da Transferência\n")
    }
    
    func successfullyMessageOfTransferDisplay() {
        print("Transferência realizada com sucesso!\n")
    }
    
    func successfullyMessageOfPaymentDisplay() {
        print("Pagamento realizado com sucesso!\n")
    }
    
    func valueDisplay(_ value: Double) {
        print("Valor: R$ \(value)\n")
    }
    
    func paymentValueDisplay(_ value: Double) {
        print("Valor do pagamento: R$ \(value)\n")
    }
    
    func currentBalanceDisplay(_ balance: Double) {
        print("Saldo atual: R$\(balance)\n")
    }
    
    func holderAccountDisplay(_ firstName: String, _ lastName: String, _ documentNumber: String, _ bank: String, _ branch: Int, _ account: Int, _ balance: Double) {
        print("Conta de origem: ")
        print("Nome:        \(firstName) \(lastName)")
        print("CPF:         \(documentNumber)")
        print("Banco:       \(bank)")
        print("Agência:     \(branch)")
        print("Conta:       \(account)")
        print("Saldo:    R$ \(balance)\n")
    }
    
    func payeeAccountDisplay(_ firstName: String, _ lastName: String, _ bank: String, _ branch: Int, _ account: Int) {
        print("Conta de destino: ")
        print("Nome:        \(firstName) \(lastName)")
        print("Banco:       \(bank)")
        print("Agência:     \(branch)")
        print("Conta:       \(account)\n")
    }
    
}
