//
//  OptionsView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 30/09/21.
//

import Foundation

class OptionsView {
    
    func show(login: String) {
        
        var loop = true
        var option: Int = 0
        
        while loop {
            
            print("\n _____________________________________________ ")
            print("|                                             |")
            print("|                  MINI ITI                   |")
            print("|_____________________________________________|")
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
            print("|   6 - Gerenciar Perfil                      |")
            print("|                                             |")
            print()
            
            guard let input = readLine() else { return }
            print("Sua escolha: \(input)")
            option = Int(input) ?? 0
            
            switch option {
            case 0:
                loop = false
            case 1: break
                // PIX
            case 2: break
                // Cartão de Crédito iti
            case 3: break
                // Pagar e Transferir
            case 4: break
                // Colocar Dinheiro
            case 5: break
                // Gerenciar Cartões
            case 6: break
                // Gerenciar Perfil
                
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
}
