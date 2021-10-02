//
//  Service.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 30/09/21.
//

import Foundation

class CreateUserView {
    
    // MARK: - Attributes
    private var controller = CreateUserController()
    
    // MARK: - Methods
    func createAccount() -> String {
        
        print("\n _____________________________________________ ")
        print("|                                             |")
        print("|  Novo Usuário                               |")
        print("|_____________________________________________|\n")
        
        print("Digite o seu primeiro nome: ")
        guard let input = readLine() else { return ""}
        let firstName = input
        print()
        
        print("Digite o seu sobrenome: ")
        guard let input = readLine() else { return ""}
        let lastName = input
        print()
        
        print("Digite o seu cpf: ")
        guard let input = readLine() else { return ""}
        let document = input
        print()
        
        print("Digite o número da sua conta bancária: ")
        guard let input = readLine() else { return ""}
        let bankAccount = input
        print()
        
        print("Digite seu e-mail: ")
        guard let input = readLine() else { return ""}
        let login = input
        print()
        
        print("Digite uma senha: ")
        guard let input = readLine() else { return ""}
        let password = input
        print()
        
        let accountRequest = CreateUserModel(
            firstName: firstName,
            lastName: lastName,
            document: document,
            bankAccount: bankAccount,
            login: login,
            password: password)
        
        controller.createAccount(request: accountRequest)
        print("Cadastro realizado com Sucesso!")
        
        return cpf
    }
}
