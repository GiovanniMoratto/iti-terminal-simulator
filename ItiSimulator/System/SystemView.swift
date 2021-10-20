//
//  SystemView.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 15/10/21.
//

import Foundation

class SystemView {
    
    // MARK: - Methods
    
    func showTitle() {
        print(" _____________________________________________ ")
        print("|                                             |")
        print("|                   SYSTEM                    |")
        print("|_____________________________________________|")
    }
    
    func showMenu() {
        print("|                                             |")
        print("|   (1) - Mini iti                            |")
        print("|   (2) - Database                            |")
        print("|                                             |")
        print("|   (0) - Desligar                            |")
        print("|                                             |\n")
    }
    
    func showExit() {
        print("Bye.\n")
    }
    
}
