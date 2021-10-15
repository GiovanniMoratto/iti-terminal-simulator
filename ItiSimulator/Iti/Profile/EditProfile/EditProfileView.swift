//
//  EditProfileView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

struct EditProfileView {
    
    // MARK: - Methods
    
    func showTitle() {
        print("\n _____________________________________________ ")
        print("|                                             |")
        print("|   Editar informações                        |")
        print("|_____________________________________________|")
    }
    
    func showMenu() {
        print("|   O que deseja atualizar ?                  |")
        print("|                                             |")
        print("|   (1) - Nome                                |")
        print("|   (2) - Endereço                            |")
        print("|   (3) - Cidade                              |")
        print("|   (4) - Estado                              |")
        print("|                                             |")
        print("|   (0) - Voltar                              |")
        print("|                                             |\n")
    }
    
    func currentUsername(_ firstName: String, _ lastName: String) {
        print("Nome atual: \(firstName) \(lastName)\n")
    }
    
    func currentAddress(_ address: String) {
        print("Endereço atual: \(address)\n")
    }
    
    func currentCity(_ city: String) {
        print("Cidade atual: \(city)\n")
    }
    
    func currentState(_ state: String) {
        print("Estado atual: \(state)\n")
    }
    
    func successfullyUpdateMessage() {
        print("O campo foi atualizado com sucesso!")
    }
    
    
}
