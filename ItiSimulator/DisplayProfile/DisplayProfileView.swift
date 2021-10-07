//
//  ShowProfileView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

class DisplayProfileView {
    
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
    
    func showDocumentNumberField(documentNumber: String?) {
        guard let documentNumberUnwrapped = documentNumber else { return }
        
        print("CPF: \(documentNumberUnwrapped)\n")
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
    
}
