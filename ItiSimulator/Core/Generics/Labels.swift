//
//  Label.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 06/10/21.
//

import Foundation

class Labels {
    
//    // MARK: - Methods
//
//    func getInput() -> String? {
//        let input = readLine()
//        print()
//        return input
//    }
//
//    func showFirstNameRequestLabel() {
//        print("Digite o seu primeiro nome: ")
//    }
//
//    func showLastNameRequestLabel() {
//        print("Digite o seu sobrenome: ")
//    }
//
//    func showDocumentNumberRequestLabel() {
//        print("Digite o seu CPF: ")
//    }
//
////    func showBankAccountRequestLabel() {
////        print("Digite o número da sua conta bancária: ")
////    }
//
//    func showPasswordRequestLabel() {
//        print("Digite sua senha: ")
//    }
//
//    func showAddressRequestLabel() {
//        print("Digite o seu endereço: ")
//    }
//
//    func showCityRequestLabel() {
//        print("Digite a sua cidade: ")
//    }
//
//    func showStateRequestLabel() {
//        print("Digite o seu estado: ")
//    }
    
    func showOverview(_ firstNameWrapped: String?, _ lastNameWrapped: String?, _ balanceWrapped: Double?) {
        guard let firstName = firstNameWrapped else { return }
        guard let lastName = lastNameWrapped else { return }
        guard let balance = balanceWrapped else { return }
        
        let username = "\(firstName) \(lastName)"
        print("                       \(username)")
        print("                       Saldo: R$ \(balance)")
    }
    
    func showHolderAccountRequestLabel() {
        print("Digite o número da conta de origem: ")
    }
    
    func showHolderAccountLabel() {
        print("Conta de origem: \n")
    }
    
    func showHolderAccountBranch(_ branchWrapped: Int?) {
        guard let branch = branchWrapped else { return }
        
        print("     Agência: \(branch)")
    }
    
    func showHolderAccountNumber(_ accountNumberWrapped: Int?) {
        guard let accountNumber = accountNumberWrapped else { return }
        
        print("     Número da conta: \(accountNumber)")
    }
    
    func showPayeeAccountLabel() {
        print("Conta de destino: \n")
    }
    
    func showPayeeAccountBranchRequestLabel() {
        print("Digite o número da conta de destino: ")
    }
    
    func showPayeeAccountNumberRequestLabel() {
        print("Digite o número da agência de destino: ")
    }
    
}
