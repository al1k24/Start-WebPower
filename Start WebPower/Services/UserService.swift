//
//  UserService.swift
//  Start WebPower
//
//  Created by Алик on 1/1/20.
//  Copyright © 2020 ALIK MOLDOVANU. All rights reserved.
//

import Foundation

class UserService {
    
    static let shared = UserService()
    
    var networking: Networking
    var fetcher: DataFetcher
    
    private init() {
        self.networking = NetworkService()
        self.fetcher = NetworkDataFetcher(networking: networking)
    }
    
    func getUserInfo(completion: @escaping (UserInfoResponse) -> Void) { //Обработать ошибки
        fetcher.getUserInfo() { (response) in
            guard let response = response else { return }
            
            completion(response)
        }
    }
    
    func authUser(login: String, password: String, completion: @escaping (AuthResult) -> Void) {
        guard Validator.isAuthFormFilled(login: login, password: password) else {
            completion(.failure(AuthError.notFilled))
            return
        }
        
        fetcher.authUser(login: login, password: password) { (response, error) in
            if let error = error {
                completion(.failure(AuthError.responseError(error.localizedDescription)))
                return
            }
            
            guard let response = response else {
                completion(.failure(AuthError.serverError))
                return
            }
            
            if let error = response.error, !(error.isEmpty) {
                completion(.failure(AuthError.responseError(error)))
                return
            }
            
            if let success = response.success, !(success.isEmpty) {
                completion(.success(success))
                return
            }
            
            completion(.failure(AuthError.unknownError))
        }
    }
    
    func registerUser(login: String, email: String, password: String, completion: @escaping (AuthResult) -> Void) {
        guard Validator.isRegistrationFormFilled(login: login, email: email, password: password) else {
            completion(.failure(AuthError.notFilled))
            return
        }
        
        guard Validator.isValidEmail(email) else {
            completion(.failure(AuthError.invalidEmail))
            return
        }
        
        fetcher.registerUser(login: login, email: email, password: password) { (response, error) in
            if let error = error {
                completion(.failure(AuthError.responseError(error.localizedDescription)))
                return
            }
            
            guard let response = response else {
                completion(.failure(AuthError.serverError))
                return
            }
            
            if let error = response.error {
                completion(.failure(AuthError.responseError(error)))
                return
            }
            
            if let success = response.success {
                completion(.success(success))
                return
            }
            
            completion(.failure(AuthError.unknownError))
        }
    }
}
