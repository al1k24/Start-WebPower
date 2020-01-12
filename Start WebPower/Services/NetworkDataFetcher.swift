//
//  NetworkDataFetcher.swift
//  Start WebPower
//
//  Created by Алик on 1/1/20.
//  Copyright © 2020 ALIK MOLDOVANU. All rights reserved.
//

import Foundation

protocol DataFetcher {
    func getUserInfo(completion: @escaping (UserInfoResponse?, Error?) -> Void)
    func authUser(login: String, password: String, completion: @escaping (UserAuthResponse?, Error?) -> Void)
    func registerUser(login: String, email: String, password: String, completion: @escaping (UserRegistrationResponse?, Error?) -> Void)
}

class NetworkDataFetcher: DataFetcher {
    
    let networking: Networking
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    func getUserInfo(completion: @escaping (UserInfoResponse?, Error?) -> Void) {
        let path = API.userData
        networking.request(path: path, method: .get, httpBody: nil) { [weak self] (data, error) in
            let decoded = self?.decodeJSON(type: UserInfoResponse.self, from: data)
            completion(decoded, error)
        }
    }
    
    func authUser(login: String, password: String, completion: @escaping (UserAuthResponse?, Error?) -> Void) {
        let path = API.auth
        networking.request(path: path, method: .post, httpBody: nil) { [weak self] (data, error) in
            guard let self = self else {
                completion(nil, error)
                return
            }
            
            let decoded = self.decodeJSON(type: UserAuthResponse.self, from: data)
            completion(decoded, error)
        }
    }
    
    func registerUser(login: String, email: String, password: String, completion: @escaping (UserRegistrationResponse?, Error?) -> Void) {
        let path = API.register
        let params = [
            "email": email,
            "nickname": login,
            "password": password
        ]
        let httpBody = formatHttpBody(by: params)
    
        networking.request(path: path, method: .post, httpBody: httpBody) { [weak self] (data, error) in
            var registrationResponse = UserRegistrationResponse(error: nil, success: nil)
            
            guard let self = self else {
                completion(registrationResponse, error)
                return
            }
            
            if var response = self.decodeString(from: data) {
                if self.checkRegistrationResponse(&response) {
                    registrationResponse = UserRegistrationResponse(error: response, success: nil)
                } else {
                    registrationResponse = UserRegistrationResponse(error: nil, success: response)
                }
                
                completion(registrationResponse, error)
                return
            }
            
            completion(nil, error)
        }
    }
    
    private func checkRegistrationResponse(_ response: inout String) -> Bool {
        if response.contains("Ошибка регитрации:") {
            let message = response.components(separatedBy: ": ")
            
            if !(message[1].isEmpty) {
                response = message[1].capitalizingFirstLetter()
            } else {
                response = "Что-то пошло не так"
            }
            
            return true
        }
        
        return false
    }
    
    private func formatHttpBody(by params: [String: String]) -> Data? {
        let postString = params.map { "\($0)=\($1)" }.joined(separator: "&")
        let httpBody = postString.data(using: String.Encoding.utf8)
        
        return httpBody
    }
    
    private func decodeString(from data: Data?) -> String? {
        guard let data = data, let response = String(data: data, encoding: .utf8) else { return nil }
        
        return response
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else { return nil }
        
        return response
    }
}
