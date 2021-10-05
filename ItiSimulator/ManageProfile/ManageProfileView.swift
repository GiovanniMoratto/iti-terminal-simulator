//
//  ProfileView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

class ManageProfileView {
    
    func showTitle() {
        print("\n _____________________________________________ ")
        print("|                                             |")
        print("|   Perfil                                    |")
        print("|_____________________________________________|")
    }
    
    func showMenu() {
        print("|                                             |")
        print("|   O que deseja fazer ?                      |")
        print("|                                             |")
        print("|   0 - Voltar                                |")
        print("|   1 - Exibir informações                    |")
        print("|   2 - Editar informações                    |")
        print("|   3 - Excluir conta                         |")
        print("|                                             |\n")
    }
    
    func getInput() -> String? {
        let input = readLine()
        print()
        return input
    }
    
}
