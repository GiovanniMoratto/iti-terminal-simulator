//
//  PixRegisterView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 13/10/21.
//

import Foundation

struct PixKeyRegisterView {
    
    // MARK: - Methods
    
    func showTitle() {
        print("\n _____________________________________________ ")
        print("|                                             |")
        print("|  Pix - Cadastrar chave                      |")
        print("|_____________________________________________|")
    }
    
    func showMenu() {
        print("|                                             |")
        print("|   Qual o tipo de chave ?                    |")
        print("|                                             |")
        print("|   (1) - CPF                                 |")
        print("|   (2) - E-mail                              |")
        print("|   (3) - Telefone                            |")
        print("|                                             |")
        print("|   (0) - Voltar                              |")
        print("|                                             |\n")
    }
    
  
    
    func successfullyMessage(){
        print("Chave cadastrada com sucesso!\n")
    }
    
    func pixCpfAlreadyExists() {
        print("Já existe uma chave CPF cadastrada.\n")
    }
    
    func pixEmailAlreadyExists() {
        print("Já existe uma chave E-mail cadastrada.\n")
    }
    
    func pixPhoneAlreadyExists() {
        print("Já existe uma chave Telefone cadastrada.\n")
    }
    
}
