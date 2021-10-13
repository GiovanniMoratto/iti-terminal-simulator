//
//  TransferView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

struct TransferView {
    
    // MARK: - Methods
    
    func showTitle() {
        print("\n _____________________________________________ ")
        print("|                                             |")
        print("|   Tranferir                                 |")
        print("|_____________________________________________|\n")
    }
    
    func transferBankRequest() {
        print("Digite o nome do banco de destino: ")
    }
    
    func transferBranchRequest() {
        print("Digite o número da agência de destino: ")
    }
    
    func transferAccountRequest() {
        print("Digite o número da conta de destino: ")
    }
    
    func transferValueRequest() {
        print("Digite o valor da transferencia: ")
    }
    
    func successfullyMessage() {
        print("Transferência realizada com sucesso!\n")
    }
    
    func confirmDataTransfer() {
        print("         Confirme os dados da Transferência\n")
    }
    
}
