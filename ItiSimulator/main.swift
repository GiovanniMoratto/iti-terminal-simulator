//
//  main.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 29/09/21.
//

import Foundation

start()

func start() {
    
    var firstLoop = true
    var firstOperation: Int = 0
    
    while firstLoop {
        print("###############################################")
        print("################# iti - Itaú ##################")
        print("\n")
        print("### Bem-vindo ao iti, sua carteira digital. ###")
        print()
        print("# O que deseja fazer ? #")
        print()
        print("0 - Sair")
        print("1 - Login")
        print("2 - Cadastrar Conta")
        print()
        
        guard let input = readLine() else { return }
        firstOperation = Int(input) ?? 0
        
        switch firstOperation {
        case 0:
            firstLoop = false
        case 1:
            // Login
            print()
            print("###############################################")
            print("Login: ")
            guard let input = readLine() else { return }
            let login = input
            print("Senha: ")
            guard let input = readLine() else { return }
            let senha = input
            
            // Check Login
            print()
            print("Verificando dados...")
            print()
            
            var secondLoop = true
            var secondOperation: Int = 0
            
            while secondLoop {
                print("\n")
                print("### Bem-vindo \(login) ###")
                print()
                print("# O que deseja fazer ? #")
                print()
                print("0 - Sair")
                print("1 - PIX")
                print("2 - Cartão de Crédito iti")
                print("3 - Pagar e Transferir")
                print("4 - Colocar Dinheiro")
                print("5 - Gerenciar Cartões")
                print("6 - Gerenciar Perfil")
                print()
                
                guard let input = readLine() else { return }
                secondOperation = Int(input) ?? 0
                
                switch secondOperation {
                case 0:
                    secondLoop = false
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
                
        case 2:
            // Cadastro Conta
            print("###############################################")
            print("\n")
        default:
            print("Por favor, escolha uma operação")
        }

    }
}
