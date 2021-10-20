//
//  UserView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

struct UserViewComponent: UserViewComponentProtocol {
    
    // MARK: - Methods
    
    /* Request Labels Messages */
    
    func firstNameRequest() {
        print("Digite o seu primeiro nome: ")
    }
    
    func lastNameRequest() {
        print("Digite o seu sobrenome: ")
    }
    
    func documentNumberRequest() {
        print("Digite o seu CPF: ")
    }
    
    func passwordRequest() {
        print("Digite sua senha: ")
    }
    
    func addressRequest() {
        print("Digite o seu endereço: ")
    }
    
    func cityRequest() {
        print("Digite a sua cidade: ")
    }
    
    func stateRequest() {
        print("Digite o seu estado: ")
    }
    
    /* Display Labels Messages */
    
    func username(_ firstName: String, _ lastName: String) {
        print("     Nome:       \(firstName) \(lastName)")
    }
    
    func documentNumber(_ documentNumber: String) {
        print("     CPF:        \(documentNumber)")
    }
    
    func address(_ address: String) {
        print("     Endereço:   \(address)")
    }
    
    func city(_ city: String) {
        print("     Cidade:     \(city)")
    }
    
    func state(_ state: String) {
        print("     Estado:     \(state)\n")
    }
    
    /* Custom Labels Messages */
    
    func exit() {
        print("(0) - Voltar")
    }
    
    func overview(_ firstName: String, _ lastName: String, _ balance: Double) {
        print("                       \(firstName) \(lastName)")
        print("                       Saldo: R$ \(balance)")
    }
    
    /* Input Labels */
    
    func getInput() -> String? {
        let input = readLine()
        print()
        return input
    }

    func getNavigation() -> Int {
        guard let inputString = readLine() else { return Int()}
        
        let inputWrapped = Int(inputString)
        guard let input = inputWrapped else { return Int()}
        print()
        
        return input
    }
    
}
