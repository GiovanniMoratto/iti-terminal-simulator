//
//  LoginView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 30/09/21.
//

import Foundation

class LoginView {
    
    // MARK: - Attributes
    private var controller = LoginController()
    
    // MARK: - Methods
    
    func show() -> UserModel {
        
        print("\n _____________________________________________ ")
        print("|                                             |")
        print("|   Login                                     |")
        print("|_____________________________________________|\n")
        
        print("Digite seu CPF:")
        guard let input = readLine() else { return UserModel()}
        let cpf = input
        print()
        
        print("Digite sua senha:")
        guard let input = readLine() else { return UserModel()}
        _ = input
        print()
        
        // Check Login
        print("Verificando dados...")
        print()
        
        let user = db.findByDocument(document: cpf)
        
        return user
    }
    
}
