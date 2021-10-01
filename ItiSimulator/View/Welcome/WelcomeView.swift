//
//  WelcomeView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 01/10/21.
//

import Foundation

class WelcomeView {

    // MARK: - Methods

    func start() {
        
        var loop = true
        var option: Int = 0
        
        while loop {
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
            
            guard let input = readLine() else { return }
            option = Int(input) ?? 0
            
            switch option {
            case 0:
                loop = false
            case 1:
                // Login
                OptionsView().show(login: LoginView().show())
            case 2:
                // Cadastro Conta
                OptionsView().show(login: AddUserView().createAccount())
                
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }

}
