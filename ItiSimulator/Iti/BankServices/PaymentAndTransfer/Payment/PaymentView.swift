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
        
    func confirmDataPayment() {
        print("\n         Confirme os dados do Pagamento\n")
    }
    
    func successfullyMessage() {
        print("Pagamento realizado com sucesso!\n")
    }
    
    func paymentValue(_ value: Double) {
        print("Valor do pagamento: R$ \(value)")
    }

}
