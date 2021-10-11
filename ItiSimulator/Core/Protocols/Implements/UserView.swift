//
//  UserView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 11/10/21.
//

import Foundation

struct UserView: UserViewProtocol {
    
    // MARK: - Methods
    
    /* Request Labels Messages */
    
    func firstNameRequest(){
        print("Digite o seu primeiro nome: ")
    }
    
    func lastNameRequest(){
        print("Digite o seu sobrenome: ")
    }
    
    func documentNumberRequest(){
        print("Digite o seu CPF: ")
    }
    
    func passwordRequest(){
        print("Digite sua senha: ")
    }
    
    func addressRequest(){
        print("Digite o seu endereço: ")
    }
    
    func cityRequest(){
        print("Digite a sua cidade: ")
    }
    
    func stateRequest(){
        print("Digite o seu estado: ")
    }
    
    /* Display Labels Messages */
    
    func username(_ firstName: String, _ lastName: String){
        print("Nome: \(firstName) \(lastName)\n")
    }
    
    func documentNumber(_ documentNumber: String){
        print("CPF: \(documentNumber)\n")
    }
    
    func address(_ address: String){
        print("Endereço: \(address)\n")
    }
    
    func city(_ city: String){
        print("Cidade: \(city)\n")
    }
    
    func state(_ state: String){
        print("Estado: \(state)\n")
    }
    
    /* Custom Labels Messages */
    
    func exit(){
        print("(0) - Voltar")
    }
    
    func overview(_ firstName: String, _ lastName: String, _ balance: Double){
        print("                       \(firstName) \(lastName)")
        print("                       Saldo: R$ \(balance)")
    }
    
    func getInput() -> String? {
        let input = readLine()
        print()
        return input
    }
    
    func getInputNavigation() -> Int {
        guard let input = getInput() else { return Int()}
        
        let optionWrapped = Int(input)
        guard let option = optionWrapped else { return Int()}
        
        return option
    }
    
}
