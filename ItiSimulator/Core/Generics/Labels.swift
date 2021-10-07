//
//  Label.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 06/10/21.
//

import Foundation

class Labels {
    
    // MARK: - Methods
    
    func getInput() -> String? {
        let input = readLine()
        print()
        return input
    }
    
    func showFirstNameRequestLabel() {
        print("Digite o seu primeiro nome: ")
    }
    
    func showLastNameRequestLabel() {
        print("Digite o seu sobrenome: ")
    }
    
    func showDocumentNumberRequestLabel() {
        print("Digite o seu CPF: ")
    }
    
    func showBankAccountRequestLabel() {
        print("Digite o número da sua conta bancária: ")
    }
    
    func showPasswordRequestLabel() {
        print("Digite uma senha: ")
    }
    
    func showAddressRequestLabel() {
        print("Digite o seu endereço: ")
    }
    
    func showCityRequestLabel() {
        print("Digite a sua cidade: ")
    }
    
    func showStateRequestLabel() {
        print("Digite o seu estado: ")
    }
    
    func showOverviewLabel(firstName: String?, lastName: String?, balance: Double?) {
        guard let firstNameUnwrapped = firstName else { return }
        guard let lastNameUnwrapped = lastName else { return }
        guard let balanceUnwrapped = balance else { return }
        
        let username = "\(firstNameUnwrapped) \(lastNameUnwrapped)"
        print("                       \(username)")
        print("                       Saldo: R$ \(balanceUnwrapped)")
    }
    
    func showHolderAccountRequestLabel() {
        print("Digite o número da conta de origem: ")
    }
    
    func showHolderAccountLabel() {
        print("Conta de origem: \n")
    }
    
    func showHolderAccountBranchLabel(branch: Int?) {
        guard let branchUnwrapped = branch else { return }
        print("     Agência: \(branchUnwrapped)")
    }
    
    func showHolderAccountNumberLabel(accountNumber: Int?) {
        guard let accountNumberUnwrapped = accountNumber else { return }
        print("     Número da conta: \(accountNumberUnwrapped)")
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
