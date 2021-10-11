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
    
    func showBillValueRequest() {
        print("Digite o valor da conta ser paga: \n")
    }
    
    func successfullyMessage() {
        print("Pagamento realizado com sucesso!\n")
    }

}
