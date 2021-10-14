//
//  PixTransferViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 13/10/21.
//

import Foundation

struct PixTransferViewController {
    
    // MARK: - Methods
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        let scene = PixTransferView()
        let view = UserView()
        let op = BankViewController()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMenu()
            
            switch view.getNavigation() {
            case 1:
                op.pixTransferDocumentNumber(token)
            case 2:
                op.pixTransferEmail(token)
            case 3:
                op.pixTransferPhone(token)
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
}
