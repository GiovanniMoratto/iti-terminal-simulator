//
//  WelcomeView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 01/10/21.
//

import Foundation

class WelcomeView {
    
    // MARK: - Methods
    func showMenu() -> String? {
        
        print("\n _____________________________________________ ")
        print("|                                             |")
        print("|                 iti - Itaú                  |")
        print("|                                             |")
        print("|   Bem-vindo ao iti, sua carteira digital.   |")
        print("|_____________________________________________|")
        print("|                                             |")
        print("|   O que deseja fazer ?                      |")
        print("|                                             |")
        print("|   0 - Sair do App                           |")
        print("|   1 - Login                                 |")
        print("|   2 - Cadastrar Conta                       |")
        print("|                                             |")
        print()
        
        let input = readLine()
        return input
    }
    
    func showExit() {
        print("Até mais!")
    }
    
}
