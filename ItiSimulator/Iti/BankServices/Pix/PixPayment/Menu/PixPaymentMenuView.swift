//
//  PixPaymentsViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 13/10/21.
//

import Foundation

struct PixPaymentMenuView {
    
    // MARK: - Methods
    
    func showTitle() {
        print("\n _____________________________________________ ")
        print("|                                             |")
        print("|   Pix - Pagamentos                          |")
        print("|_____________________________________________|")
    }
    
    func showMenu() {
        print("|                                             |")
        print("|   O que deseja fazer ?                      |")
        print("|                                             |")
        print("|   (1) - Pagar                               |")
        print("|   (2) - Gerar QR Code                       |")
        print("|                                             |")
        print("|   (0) - Voltar                              |")
        print("|                                             |\n")
    }
    
}
