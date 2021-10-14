//
//  PixPaymentQRCodeView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 14/10/21.
//

import Foundation

struct PixPaymentQRCodeView {
    
    // MARK: - Methods
    
    func showTitle() {
        print("\n _____________________________________________ ")
        print("|                                             |")
        print("|   Pix - Pagamentos - QR Code                |")
        print("|_____________________________________________|")
    }
    
    func showMenu() {
        print("|                                             |")
        print("|   Qual tipo de chave ?                      |")
        print("|                                             |")
        print("|   (1) - CPF                                 |")
        print("|   (2) - E-mail                              |")
        print("|   (3) - Telefone                            |")
        print("|                                             |")
        print("|   (0) - Voltar                              |")
        print("|                                             |\n")
    }
    
    func showSuccessCreate() {
        print("QR Code criado com sucesso!\n")
    }
    
    func showCode(_ code: String) {
        print("QR Code: \(code)")
    }
    
    func errorQRCodeMessage() {
        print("Não foi possivel criar o QR Code, tipo de chave não cadastrado.")
    }
    
}
