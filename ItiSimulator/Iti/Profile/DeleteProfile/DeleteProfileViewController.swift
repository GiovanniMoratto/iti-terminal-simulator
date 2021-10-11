//
//  DeleteAccountViewController.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 05/10/21.
//

import Foundation

struct DeleteProfileViewController {
    
    // MARK: - Methods
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        let scene = DeleteProfileView()
        let view = UserView()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.showMessage()
            
            switch view.getNavigation() {
            case 1:
                db.delete(token)
                scene.showSuccessfullyDeleted()
                routeTo().welcome()
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
}
