//
//  Service.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 30/09/21.
//

import Foundation

class View {
    
    private var controller = Controller()
    
    func createAccount() {
        
        var firstName = ""
        var lastName = ""
        var document = ""
        var bankAccount = ""
        var login = ""
        var password = ""
        
        print("### Cadastro de Usuário ###")
        print()
        print("Digite o seu primeiro nome: ")
        guard let input = readLine() else { return }
        firstName = input
        
        print()
        print("Digite o seu sobrenome: ")
        guard let input = readLine() else { return }
        lastName = input
        
        print()
        print("Digite o seu cpf: ")
        guard let input = readLine() else { return }
        document = input
        
        print()
        print("Digite o número da sua conta bancária: ")
        guard let input = readLine() else { return }
        bankAccount = input
        
        print()
        print("Digite seu e-mail: ")
        guard let input = readLine() else { return }
        login = input
        
        print()
        print("Digite uma senha: ")
        guard let input = readLine() else { return }
        password = input
        print()
        
        let newAccount = UserRequest(
            firstName: firstName,
            lastName: lastName,
            document: document,
            bankAccount: bankAccount,
            login: login,
            password: password)
        
        controller.createAccount(newAccount: newAccount)
        print("Cadastro realizado com Sucesso!")
        print()
    }
}
