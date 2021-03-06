//
//  HomeListViewController.swift
//  Chat
//
//  Created by Konrad Belzowski on 02/12/2020.
//

import Foundation
import UIKit
import RxSwift

public class HomeListViewController: UIViewController {
    
    //
    // MARK: - Properties
    //
    
    @IBOutlet weak var logoutButton: LoadingButton!
    @IBOutlet weak var addButton: UIButton!
    
    private let viewModel = HomeListViewModel()
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
        
        let buttonAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let alert = UIAlertController(title: "Error", message: "There was some problem with logout. Please try again later.", preferredStyle: .alert)
        alert.addAction(buttonAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    //
    // MARK: - Actions
    //
    
    private func setupRx() {
        
        viewModel.logoutWithSuccess.subscribe(onNext: { [weak self] success in
            self?.logoutButton.hideLoading()

            if success {
                self?.exit()
            } else {
                self?.showAlert()
            }
        }).disposed(by: disposeBag)
    }
    
    @IBAction func logoutButtonAction(_ sender: Any) {
        logoutButton.showLoading()
        viewModel.logout()
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
    
        guard let vc = UIStoryboard(name: "HomeAdd", bundle: nil).instantiateInitialViewController() else {
            return
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
