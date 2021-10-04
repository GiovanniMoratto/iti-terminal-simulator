//
//  CreateUserView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 01/10/21.
//

import Foundation

class CreateUserView {
    
    // MARK: - Methods
    
    func showTitle() {
        print("\n _____________________________________________ ")
        print("|                                             |")
        print("|  Novo Usuário                               |")
        print("|_____________________________________________|\n")
    }
    
    func showFirstNameForm() {
        print("Digite o seu primeiro nome: ")
    }
    
    func showLastNameForm() {
        print("Digite o seu sobrenome: ")
    }
    
    func showDocumentForm() {
        print("Digite o seu cpf: ")
    }
    
    func showBankAccountForm() {
        print("Digite o número da sua conta bancária: ")
    }
    
    func showLoginForm() {
        print("Digite seu e-mail: ")
    }
    
    func showPasswordForm() {
        print("Digite uma senha: ")
    }
    
    func getInput() -> String? {
        let input = readLine()
        print()
        return input
    }
    
}
