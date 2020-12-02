//
//  LoginViewModel.swift
//  Chat
//
//  Created by Konrad Belzowski on 02/12/2020.
//

import Foundation
import FirebaseAuth
import RxSwift

public class LoginViewModel {
    
    //
    // MARK: - Properties
    //
    
    public let loginWithSuccess = PublishSubject<Bool>()
    
    //
    // MARK: - Methods
    //
    
    public func login() {
        
        Auth.auth().signInAnonymously { [weak self] (result, error) in
            if let _ = error {
                self?.loginWithSuccess.onNext(false)
            } else {
                self?.loginWithSuccess.onNext(true)
            }
        }
    }
}
