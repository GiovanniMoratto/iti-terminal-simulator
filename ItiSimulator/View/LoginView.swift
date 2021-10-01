//
//  LoginView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 30/09/21.
//

import Foundation

class LoginView {
    
    func show() -> String {
        
        print("\n _____________________________________________ ")
        print("|                                             |")
        print("|   Login                                     |")
        print("|_____________________________________________|\n")
        
        print("Digite seu CPF:")
        guard let input = readLine() else { return ""}
        let login = input
        print()
        
        print("Digite sua senha:")
        guard let input = readLine() else { return ""}
        _ = input
        print()
        
        // Check Login
        print("Verificando dados...")
        print()
        
        return login
    }
    
}
