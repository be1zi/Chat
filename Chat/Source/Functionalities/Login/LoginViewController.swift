//
//  LoginViewController.swift
//  Chat
//
//  Created by Konrad Belzowski on 02/12/2020.
//

import UIKit
import RxSwift

public class LoginViewController: UIViewController {
    
    //
    // MARK: - Properties
    //
   
    @IBOutlet weak var loginButton: LoadingButton!
    
    private let viewModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    
    //
    // MARK: - Lifecycle
    //
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRx()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //
    // MARK: - Methods
    //
    
    private func showAlert() {
        
        let buttonAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let alert = UIAlertController(title: "Error", message: "There was some problem with login. Please try again later.", preferredStyle: .alert)
        alert.addAction(buttonAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func presentHomeController() {
                
        guard let viewController = UIStoryboard(name: "HomeList", bundle: nil).instantiateInitialViewController() else {
            return
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    //
    // MARK: - Actions
    //
    
    private func setupRx() {
        
        viewModel.loginWithSuccess.subscribe(onNext: { [weak self] success in
            self?.loginButton.hideLoading()

            if success {
                self?.presentHomeController()
            } else {
                self?.showAlert()
            }
        }).disposed(by: disposeBag)
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        loginButton.showLoading()
        viewModel.login()
    }
}
