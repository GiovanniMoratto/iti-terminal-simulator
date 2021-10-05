//
//  ShowProfileView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

class ShowProfileView {
    
    // MARK: - Methods
    
    func showTitle() {
        print("\n _____________________________________________ ")
        print("|                                             |")
        print("|   Exibir informações                        |")
        print("|_____________________________________________|\n")
    }
    
    func showUsernameField(firstName: String?, lastName: String?) {
        guard let firstNameUnwrapped = firstName else { return }
        guard let lastNameUnwrapped = lastName else { return }
        
        print("Nome: \(firstNameUnwrapped) \(lastNameUnwrapped)\n")
    }
    
    func showDocumentField(document: String?) {
        guard let documentUnwrapped = document else { return }
        
        print("CPF: \(documentUnwrapped)\n")
    }
    
    func showAddressField(address: String?) {
        guard let addressUnwrapped = address else { return }
        
        print("Endereço: \(addressUnwrapped)\n")
    }
    
    func showCityField(city: String?) {
        guard let cityUnwrapped = city else { return }
        
        print("Cidade: \(cityUnwrapped)\n")
    }
    
    func showStateField(state: String?) {
        guard let stateUnwrapped = state else { return }
        
        print("Estado: \(stateUnwrapped)\n")
    }
    
    func showPhoneNumberField(phoneNumber: String?) {
        guard let phoneNumberUnwrapped = phoneNumber else { return }
        
        print("Telefone: \(phoneNumberUnwrapped)\n")
    }
    
    func showEmailField(email: String?) {
        guard let emailUnwrapped = email else { return }
        
        print("E-mail: \(emailUnwrapped)\n")
    }
    
    func showExit() {
        print("0 - Voltar")
    }
    
    func getInput() -> String? {
        let input = readLine()
        print()
        return input
    }
    
}
