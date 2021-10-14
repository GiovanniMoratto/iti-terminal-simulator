//
//  PixKeyDeleteView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 13/10/21.
//

import Foundation

struct PixKeyDeleteView {
    
    // MARK: - Methods
    
    func showTitle() {
        print("\n _____________________________________________ ")
        print("|                                             |")
        print("|   PIX - Excluir chave                       |")
        print("|_____________________________________________|")
    }
    
    func showMenu() {
        print("|                                             |")
        print("|   Qual tipo de chave deseja excluir ?       |")
        print("|                                             |")
        print("|   (1) - CPF                                 |")
        print("|   (2) - E-mail                              |")
        print("|   (3) - Telefone                            |")
        print("|                                             |")
        print("|   (0) - Voltar                              |")
        print("|                                             |\n")
    }
    
    func showMessage() {
        print("Tem certeza de que deseja excluir a chave?\n")
        print("(1) - Sim")
        print("(0) - Não\n")
    }
    
    func showSuccessfullyDeleted() {
        print("Chave excluída com sucesso!")
    }
    
    func showErrorDeleted() {
        print("Não foi possível excluir a chave")
    }
    
    func showNotExistMessage(_ value: String) {
        print("Você não possui uma chave \(value) cadastrada.")
    }
    
}
