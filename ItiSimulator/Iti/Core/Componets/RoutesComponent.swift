//
//  Routes.swift
//  ItiSimulator
//
//  Created by Giovanni Vicentin Moratto on 06/10/21.
//

import Foundation

struct RoutesComponent: RoutesComponentProtocol {
    
    // MARK: - Attributes
    
    private let userViewComponent: UserViewComponentProtocol
    private let bankViewComponent: BankViewComponentProtocol
    private let userOperationComponent: UserOperationComponentProtocol
    private let bankOperationComponent: BankOperationComponentProtocol
    private let loginComponent: LoginComponentProtocol
    
    // MARK: - Initializers (Constructors)
   
    init(userViewComponent: UserViewComponentProtocol, bankViewComponent: BankViewComponentProtocol, userOperationComponent: UserOperationComponentProtocol, bankOperationComponent: BankOperationComponentProtocol, loginComponent: LoginComponentProtocol) {
        
        self.userViewComponent = userViewComponent
        self.bankViewComponent = bankViewComponent
        self.userOperationComponent = userOperationComponent
        self.bankOperationComponent = bankOperationComponent
        self.loginComponent = loginComponent
    }
    
    // MARK: - Methods
    
    /* Initial */
    
    func welcome() {
        WelcomeViewController(
            view: WelcomeView(),
            userViewComponent: userViewComponent
        ).process()
    }
    
    func home() {
        HomeViewController(
            view: HomeView(),
            userViewComponent: userViewComponent,
            userOperationComponent: userOperationComponent, loginComponent: loginComponent
        ).process()
    }
    
    /* Security */
    
    func login() {
        LoginViewController(
            loginComponent: loginComponent
        ).process()
    }
    
    /* Profile */
    
    func profileMenu() {
        ProfileMenuViewController(
            view: ProfileMenuView(),
            userViewComponent: userViewComponent,
            userOperationComponent: userOperationComponent
        ).process()
    }
    
    func createProfile() {
        CreateProfileViewController(
            view: CreateProfileView(),
            userOperationComponent: userOperationComponent,
            loginComponent: loginComponent
        ).process()
    }
    
    func displayProfile() {
        DisplayProfileViewController(
            view: DisplayProfileView(),
            userViewComponent: userViewComponent,
            userOperationComponent: userOperationComponent
        ).process()
    }
    
    func deleteProfile() {
        DeleteProfileViewController(
            view: DeleteProfileView(),
            userViewComponent: userViewComponent,
            userOperationComponent: userOperationComponent
        ).process()
    }
    
    func editProfile() {
        EditProfileViewController(
            view: EditProfileView(),
            userViewComponent: userViewComponent,
            userOperationComponent: userOperationComponent
        ).process()
    }
    
    /* Bank Services */
    
    func paymentAndTransfer() {
        PaymentAndTransferViewController(
            view: PaymentAndTransferView(),
            userViewComponent: userViewComponent
        ).process()
    }
    
    func payment() {
        PaymentViewController(
            view: PaymentView(),
            userViewComponent: userViewComponent,
            bankOperationComponent: bankOperationComponent
        ).process()
    }
    
    func transfer() {
        TransferViewController(
            view: TransferView(),
            userViewComponent: userViewComponent,
            bankOperationComponent: bankOperationComponent
        ).process()
    }
    
    func displayAccount() {
        DisplayBankViewController(
            view: DisplayBankView(),
            userViewComponent: userViewComponent,
            bankOperationComponent: bankOperationComponent
        ).process()
    }
    
    func pixMenu() {
        PixMenuViewController(
            view: PixMenuView(),
            userViewComponent: userViewComponent,
            userOperationComponent: userOperationComponent
        ).process()
    }
    
    func pixRegister() {
        PixKeyRegisterViewController(
            view: PixKeyRegisterView(),
            userViewComponent: userViewComponent,
            bankOperationComponent: bankOperationComponent
        ).process()
    }
    
    func pixDelete() {
        PixKeyDeleteViewController(
            view: PixKeyDeleteView(),
            userViewComponent: userViewComponent,
            bankOperationComponent: bankOperationComponent
        ).process()
    }
    
    func pixTransfer() {
        PixTransferViewController(
            view: PixTransferView(),
            userViewComponent: userViewComponent,
            bankOperationComponent: bankOperationComponent
        ).process()
    }
    
    func pixPaymentMenu() {
        PixPaymentMenuViewController(
            view: PixPaymentMenuView(),
            userViewComponent: userViewComponent,
            userOperationComponent: userOperationComponent
        ).process()
    }
    
    func pixPaymentQRCode() {
        PixPaymentQRCodeViewController(
            view: PixPaymentQRCodeView(),
            userViewComponent: userViewComponent,
            bankOperationComponent: bankOperationComponent
        ).process()
    }
    
    func pixPaymentPay() {
        PixPaymentPayViewController(
            view: PixPaymentPayView(),
            userViewComponent: userViewComponent,
            bankOperationComponent: bankOperationComponent
        ).process()
    }
    
    /* Database */
    
    func database() {
        DatabaseViewController().process()
    }
    
    /* System */
    
    func system() {
        SystemViewController().process()
    }
    
}
