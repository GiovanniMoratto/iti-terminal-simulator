//
//  InsertMoneyView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 13/10/21.
//

import Foundation

struct DisplayBankView {
    
    // MARK: - Methods
    
    func showTitle() {
        print("\n _____________________________________________ ")
        print("|                                             |")
        print("|   Dados da conta                            |")
        print("|_____________________________________________|\n")
    }
    
    func myData() {
        print("Dados para Pagamentos e Transferências\n")
    }
    
    func bank(_ bank: String) {
        print("Banco:   \(bank)")
    }
    
    func branch(_ branch: Int) {
        print("Agência: \(branch)")
    }
    
    func account(_ account: Int) {
        print("Conta:   \(account)")
    }
    
    func pix() {
        print("Pix:")
    }
    
    func pixTypesAndValues(_ key: String, _ value: String) {
        print("         \(key): \(value)")
    }
    
}
