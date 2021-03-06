//
//  WelcomeView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 01/10/21.
//

import Foundation

struct WelcomeView {
    
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
        print("|   (1) - Login                               |")
        print("|   (2) - Abrir Conta                         |")
        print("|                                             |")
        print("|   (0) - Sair do App                         |")
        print("|                                             |\n")
    }
    
    func showExit() {
        print("Até mais!\n")
    }
    
}
