//
//  HomeViewController.swift
//  Chat
//
//  Created by Konrad Belzowski on 02/12/2020.
//

import Foundation
import UIKit
import RxSwift

public class HomeViewController: UIViewController {
    
    //
    // MARK: - Properties
    //
    
    @IBOutlet weak var logoutButton: UIButton!

    private let viewModel = HomeViewModel()
    private let disposeBag = DisposeBag()
    
    //
    // MARK: - Lifecycle
    //
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRx()
        navigationItem.hidesBackButton = true
    }
    
    //
    // MARK: - Methods
    //
    
    private func exit() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func showAlert() {
        
    }
    
    //
    // MARK: - Actions
    //
    
    private func setupRx() {
        
        viewModel.logoutWithSuccess.subscribe(onNext: { [weak self] success in
            if success {
                self?.exit()
            } else {
                self?.showAlert()
            }
        }).disposed(by: disposeBag)
    }
    
    @IBAction func logoutButtonAction(_ sender: Any) {
        viewModel.logout()
    }
}
