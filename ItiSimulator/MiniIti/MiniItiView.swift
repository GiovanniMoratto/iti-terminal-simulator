//
//  MiniItiView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 04/10/21.
//

import Foundation

class MiniItiView {
    
    // MARK: - Methods
    
    func showTitle() {
        print("\n _____________________________________________ ")
        print("|                                             |")
        print("|                  MINI ITI                   |")
        print("|_____________________________________________|")
    }
    
    func showMenu() {
        print("|                                             |")
        print("|   Bem vindo(a)!                             |")
        print("|   O que deseja fazer ?                      |")
        print("|                                             |")
        print("|   0 - Voltar                                |")
        print("|   1 - PIX                                   |")
        print("|   2 - Cartão de Crédito iti                 |")
        print("|   3 - Pagar e Transferir                    |")
        print("|   4 - Colocar Dinheiro                      |")
        print("|   5 - Gerenciar Cartões                     |")
        print("|   6 - Acessar Perfil                        |")
        print("|                                             |\n")
    }
    
    func getInput() -> String? {
        let input = readLine()
        print()
        return input
    }

}