//
//  LoginView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 04/10/21.
//

import Foundation

class LoginView {
    
    // MARK: - Methods
    
    func showTitle() {
        print("\n _____________________________________________ ")
        print("|                                             |")
        print("|   Login                                     |")
        print("|_____________________________________________|\n")
    }
    
    func showDocumentForm() {
        print("Digite seu CPF: ")
    }
    
    func showPasswordForm() {
        print("Digite sua senha: ")
    }
    
    func getInput() -> String? {
        let input = readLine()
        print()
        return input
    }
    
    func checkCredentials(document: String, password: String) {
        print("Verificando dados...")
        print()
    }
    
}
