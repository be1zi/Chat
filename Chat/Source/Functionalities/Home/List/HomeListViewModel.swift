//
//  HomeListViewModel.swift
//  Chat
//
//  Created by Konrad Belzowski on 02/12/2020.
//

import Foundation
import Firebase
import RxSwift

public class HomeListViewModel {
    
    //
    // MARK: - Properties
    //
    
    public let logoutWithSuccess = PublishSubject<Bool>()
    
    //
    // MARK: - Methods
    //
    
    public func logout() {
        
        if let user = Auth.auth().currentUser {
            user.delete { [weak self] error in
                if let _ = error {
                    self?.logoutWithSuccess.onNext(false)
                } else {
                    self?.logoutWithSuccess.onNext(true)
                }
            }
        } else {
            do {
                try Auth.auth().signOut()
                logoutWithSuccess.onNext(true)
            } catch {
                logoutWithSuccess.onNext(false)
            }
        }
    }
}
