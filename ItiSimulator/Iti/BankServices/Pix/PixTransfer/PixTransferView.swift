//
//  PixTransferView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 13/10/21.
//

import Foundation

struct PixTransferView {
    
    func showTitle() {
        print("\n _____________________________________________ ")
        print("|                                             |")
        print("|   Pix - Transferência                       |")
        print("|_____________________________________________|")
    }
    
    func showMenu() {
        print("|                                             |")
        print("|   Qual tipo de chave do beneficiado ?       |")
        print("|                                             |")
        print("|   (1) - CPF                                 |")
        print("|   (2) - E-mail                              |")
        print("|   (3) - Telefone                            |")
        print("|                                             |")
        print("|   (0) - Voltar                              |")
        print("|                                             |\n")
    }
    
    func payeePixValueRequest() {
        print("Digite a chave do beneficiado: ")
    }
    
}
