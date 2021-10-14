//
//  InsertMoney.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 13/10/21.
//

import Foundation

struct DisplayBankViewController {
    
    func process(_ tokenWrapped: String?) {
        guard let token = tokenWrapped else { return }
        
        let scene = DisplayBankView()
        let view = UserView()
        
        var loop = true
        
        while loop {
            scene.showTitle()
            scene.myData()
            routeTo().bank().accountInfo(token)
            view.exit()
            
            switch view.getNavigation() {
            case 0:
                loop = false
            default:
                print("Por favor, escolha uma operação")
            }
        }
    }
    
}
