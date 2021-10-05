//
//  DeleteAccountView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

class DeleteAccountView {
    
    // MARK: - Methods
    
    func showTitle() {
        print("\n _____________________________________________ ")
        print("|                                             |")
        print("|   Excluir conta                             |")
        print("|_____________________________________________|\n")
    }
    
    func showMessage() {
        print("Tem certeza de que deseja excluir a conta?\n")
        print("0 - Não")
        print("1 - Sim\n")
    }
    
    func showSuccessfullyDeleted() {
        print("Conta excluída com sucesso!")
    }
    
    func showErrorDeleted() {
        print("Não foi possível excluir a conta")
    }
    
    func getInput() -> String? {
        let input = readLine()
        print()
        return input
    }
    
}
