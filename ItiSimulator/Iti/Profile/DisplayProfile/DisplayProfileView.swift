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
    
    func showUsernameField(_ firstNameWrapped: String?, _ lastNameWrapped: String?) {
        guard let firstName = firstNameWrapped else { return }
        guard let lastName = lastNameWrapped else { return }
        
        print("Nome: \(firstName) \(lastName)\n")
    }
    
    func showDocumentNumberField(_ documentNumberWrapped: String?) {
        guard let documentNumber = documentNumberWrapped else { return }
        
        print("CPF: \(documentNumber)\n")
    }
    
    func showAddressField(_ addressWrapped: String?) {
        guard let address = addressWrapped else { return }
        
        print("Endereço: \(address)\n")
    }
    
    func showCityField(_ cityWrapped: String?) {
        guard let city = cityWrapped else { return }
        
        print("Cidade: \(city)\n")
    }
    
    func showStateField(_ stateWrapped: String?) {
        guard let state = stateWrapped else { return }
        
        print("Estado: \(state)\n")
    }
    
    func showExit() {
        print("(0) - Voltar")
    }
    
}
