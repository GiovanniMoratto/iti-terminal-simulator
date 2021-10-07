//
//  ViewsRoutes.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 06/10/21.
//

import Foundation

class ViewsRoutes {
    
    // MARK: - Methods
    
    func label() -> Labels {
        return Labels()
    }
    
    func home() -> HomeView {
        return HomeView()
    }
    
    func login() -> LoginView {
        return LoginView()
    }
    
    func create() -> CreateProfileView {
        return CreateProfileView()
    }
    
    func welcome() -> WelcomeView {
        return WelcomeView()
    }
    
    func manageProfile() -> ManageProfileView {
        return ManageProfileView()
    }
    
    func displayProfile() -> DisplayProfileView {
        return DisplayProfileView()
    }
    
    func deleteAccount() -> DeleteAccountView {
        return DeleteAccountView()
    }
    
    func editProfile() -> EditProfileView {
        return EditProfileView()
    }
    
    func database() -> DatabaseView {
        return DatabaseView()
    }
}
