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
    
    func createProfile() -> CreateProfileView {
        return CreateProfileView()
    }
    
    func welcome() -> WelcomeView {
        return WelcomeView()
    }
    
    func profile() -> ProfileView {
        return ProfileView()
    }
    
    func displayProfile() -> DisplayProfileView {
        return DisplayProfileView()
    }
    
    func deleteProfile() -> DeleteProfileView {
        return DeleteProfileView()
    }
    
    func editProfile() -> EditProfileView {
        return EditProfileView()
    }
    
    func database() -> DatabaseView {
        return DatabaseView()
    }
    
    func paymentAndTransfer() -> PaymentAndTransferView {
        return PaymentAndTransferView()
    }
    
    func payment() -> PaymentView {
        return PaymentView()
    }
    
    func transfer() -> TransferView {
        return TransferView()
    }
    
}
