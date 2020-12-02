//
//  LoginViewController.swift
//  Chat
//
//  Created by Konrad Belzowski on 02/12/2020.
//

import UIKit

public class LoginViewController: UIViewController {
    
    //
    // MARK: - Properties
    //
   
    @IBOutlet weak var loginButton: UIButton!
    
    private let viewModel = LoginViewModel()
    
    //
    // MARK: - Actions
    //
    
    @IBAction func loginButtonAction(_ sender: Any) {
        viewModel.login()
    }
}
