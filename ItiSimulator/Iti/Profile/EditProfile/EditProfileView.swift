//
//  EditProfileView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

class EditProfileView {
    
    // MARK: - Methods
    
    func showTitle() {
        print("\n _____________________________________________ ")
        print("|                                             |")
        print("|   Editar informações                        |")
        print("|_____________________________________________|")
    }
    
    func showMenu() {
        print("|   O que deseja atualizar ?                  |")
        print("|                                             |")
        print("|   (1) - Nome                                  |")
        print("|   (2) - Endereço                              |")
        print("|   (3) - Cidade                                |")
        print("|   (4) - Estado                                |")
        print("|                                             |")
        print("|   (0) - Voltar                                |")
        print("|                                             |\n")
    }
    
    func showUsernameField(firstName: String?, lastName: String?) {
        guard let firstNameUnwrapped = firstName else { return }
        guard let lastNameUnwrapped = lastName else { return }
        
        print("Nome atual: \(firstNameUnwrapped) \(lastNameUnwrapped)\n")
    }
    
    func showAddressField(address: String?) {
        guard let addressUnwrapped = address else { return }
        
        print("Endereço atual: \(addressUnwrapped)\n")
    }
    
    func showCityField(city: String?) {
        guard let cityUnwrapped = city else { return }
        
        print("Cidade atual: \(cityUnwrapped)\n")
    }
    
    func showStateField(state: String?) {
        guard let stateUnwrapped = state else { return }
        
        print("Estado atual: \(stateUnwrapped)\n")
    }
    
    func showSuccessfullyUpdate(field: String?) {
        guard let fieldUnwrapped = field else { return }
        
        print("O campo \(fieldUnwrapped) foi atualizado com sucesso!")
    }
    
}
