//
//  Payment.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

struct PaymentView {
    
    // MARK: - Methods
    
    func showTitle() {
        print("\n _____________________________________________ ")
        print("|                                             |")
        print("|   Pagar                                     |")
        print("|_____________________________________________|\n")
    }
    
    func showBillLabel() {
        print("Digite o valor da conta ser paga: \n")
    }
    
    func successfullyPaymentMessage() {
        print("Pagamento realizado com sucesso!\n")
    }
    
    func currentBalance(_ balance: Double) {
        print("Saldo atual: R$\(balance)\n")
    }

    
}
