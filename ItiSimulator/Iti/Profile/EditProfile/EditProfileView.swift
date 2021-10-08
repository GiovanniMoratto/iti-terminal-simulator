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
        print("|   (1) - Nome                                |")
        print("|   (2) - Endereço                            |")
        print("|   (3) - Cidade                              |")
        print("|   (4) - Estado                              |")
        print("|                                             |")
        print("|   (0) - Voltar                              |")
        print("|                                             |\n")
    }
    
    func showUsernameField(_ firstNameWrapped: String?, _ lastNameWrapped: String?) {
        guard let firstName = firstNameWrapped else { return }
        guard let lastName = lastNameWrapped else { return }
        
        print("Nome atual: \(firstName) \(lastName)\n")
    }
    
    func showAddressField(_ addressWrapped: String?) {
        guard let address = addressWrapped else { return }
        
        print("Endereço atual: \(address)\n")
    }
    
    func showCityField(_ cityWrapped: String?) {
        guard let city = cityWrapped else { return }
        
        print("Cidade atual: \(city)\n")
    }
    
    func showStateField(_ stateWrapped: String?) {
        guard let state = stateWrapped else { return }
        
        print("Estado atual: \(state)\n")
    }
    
    func showSuccessfullyUpdate() {
        print("O campo foi atualizado com sucesso!")
    }
    
}
