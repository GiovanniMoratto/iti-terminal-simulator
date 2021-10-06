//
//  WelcomeView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 01/10/21.
//

import Foundation

class WelcomeView {
    
    // MARK: - Methods
    
    func showTitle() {
        print("\n _____________________________________________ ")
        print("|                                             |")
        print("|                 iti - Itaú                  |")
        print("|                                             |")
        print("|   Bem-vindo ao iti, sua carteira digital.   |")
        print("|_____________________________________________|")
    }
    
    func showMenu() {
        print("|                                             |")
        print("|   O que deseja fazer ?                      |")
        print("|                                             |")
        print("|   0 - Sair do App                           |")
        print("|   1 - Login                                 |")
        print("|   2 - Cadastrar Conta                       |")
        print("|   3 - Exibir Banco de dados                 |")
        print("|                                             |\n")
    }
    
    func getInput() -> String? {
        let input = readLine()
        print()
        return input
    }
    
    func showExit() {
        print("Até mais!")
    }
    
}
