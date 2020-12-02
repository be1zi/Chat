//
//  HomeViewModel.swift
//  Chat
//
//  Created by Konrad Belzowski on 02/12/2020.
//

import Foundation
import Firebase
import RxSwift

public class HomeViewModel {
    
    //
    // MARK: - Properties
    //
    
    public let logoutWithSuccess = PublishSubject<Bool>()
    
    //
    // MARK: - Methods
    //
    
    public func logout() {
        do {
            try Auth.auth().signOut()
            logoutWithSuccess.onNext(true)
        } catch {
            logoutWithSuccess.onNext(false)
            print(error)
        }
    }
}
