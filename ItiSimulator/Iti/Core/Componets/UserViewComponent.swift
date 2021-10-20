//
//  UserView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

struct UserViewComponent: UserViewComponentProtocol {
    
    // MARK: - Methods: Input Request Labels Messages
    
    func userFirstNameRequest() {
        print("Digite o seu primeiro nome: ")
    }
    
    func userLastNameRequest() {
        print("Digite o seu sobrenome: ")
    }
    
    func userDocumentNumberRequest() {
        print("Digite o seu CPF: ")
    }
    
    func userPasswordRequest() {
        print("Digite sua senha: ")
    }
    
    func userAddressRequest() {
        print("Digite o seu endereço: ")
    }
    
    func userCityRequest() {
        print("Digite a sua cidade: ")
    }
    
    func userStateRequest() {
        print("Digite o seu estado: ")
    }
    
    // MARK: - Methods: Receive Input
    
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
    
    // MARK: - Methods: Show Information Labels Messages
    
    func exitDisplay() {
        print("(0) - Voltar")
    }
    
    func usernameDisplay(_ firstName: String, _ lastName: String) {
        print("     Nome:       \(firstName) \(lastName)")
    }
    
    func documentNumberDisplay(_ documentNumber: String) {
        print("     CPF:        \(documentNumber)")
    }
    
    func addressDisplay(_ address: String) {
        print("     Endereço:   \(address)")
    }
    
    func cityDisplay(_ city: String) {
        print("     Cidade:     \(city)")
    }
    
    func stateDisplay(_ state: String) {
        print("     Estado:     \(state)\n")
    }
    
    func overviewDisplay(_ firstName: String, _ lastName: String, _ balance: Double) {
        print("                       \(firstName) \(lastName)")
        print("                       Saldo: R$ \(balance)")
    }
    
}
