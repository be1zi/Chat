//
//  LoginViewModel.swift
//  Chat
//
//  Created by Konrad Belzowski on 02/12/2020.
//

import Foundation
import FirebaseAuth

public class LoginViewModel {
    
    //
    // MARK: - Methods
    //
    
    public func login() {
        
        Auth.auth().signInAnonymously { [weak self] (result, error) in
            print(result?.user)
        }
    }
}
