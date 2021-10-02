//
//  ProfileView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 01/10/21.
//

import Foundation

class ProfileMenuView {
    
    // MARK: - Methods
    
    func show(login: String) {
        
        var loop = true
        var option: Int = 0
        
        while loop {
            
            print("\n _____________________________________________ ")
            print("|                                             |")
            print("|                  Perfil                     |")
            print("|_____________________________________________|")
            print("|                                             |")
            print("|   O que deseja fazer ?                      |")
            print("|                                             |")
            print("|   0 - Voltar                                |")
            print("|   1 - Exibir dados                          |")
            print("|   2 - Editar dados                          |")
            print("|   3 - Excluir cadastro                      |")
            print("|                                             |")
            print()
            
            guard let input = readLine() else { return }
            print("Sua escolha: \(input)")
            option = Int(input) ?? 0
            
            switch option {
            case 0:
                loop = false
            case 1: break
                // Exibir dados
            case 2: break
                // Editar dados
            case 3: break
                // Excluir cadastro
                
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
}
