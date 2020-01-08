//
//  NetworkDataFetcher.swift
//  Start WebPower
//
//  Created by Алик on 1/1/20.
//  Copyright © 2020 ALIK MOLDOVANU. All rights reserved.
//

import Foundation

protocol DataFetcher {
    func getUserInfo(completion: @escaping (UserInfoResponse?) -> Void)
    func authUser(login: String, password: String, completion: @escaping (UserAuthResponse?) -> Void)
    func regUser(login: String, email: String, password: String, completion: @escaping (UserRegResponse?) -> Void)
}

struct NetworkDataFetcher: DataFetcher {
    
    let networking: Networking
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    func getUserInfo(completion: @escaping (UserInfoResponse?) -> Void) {
        let path = API.userData
        networking.request(path: path, params: nil, method: .get) { (data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                completion(nil)
            }
            
            let decoded = self.decodeJSON(type: UserInfoResponse.self, from: data)
            
            completion(decoded)
        }
    }
    
    func authUser(login: String, password: String, completion: @escaping (UserAuthResponse?) -> Void) {
        
        let path = API.auth
        networking.request(path: path, params: nil, method: .post) { (data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                completion(nil)
            }
            
            let decoded = self.decodeJSON(type: UserAuthResponse.self, from: data)
            
            completion(decoded)
        }
    }
    
    func regUser(login: String, email: String, password: String, completion: @escaping (UserRegResponse?) -> Void) {
        
        let path = API.reg
        let params = [
            "nickname": "alik",
            "email": "alik@mail.ru",
            "password": "alik123"
        ]
        
        networking.request(path: path, params: params, method: .post) { (data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                completion(nil)
            }
            
            print(data!)
            
            let decoded = self.decodeJSON(type: UserRegResponse.self, from: data)
            
            completion(decoded)
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let data = from, let response = try? decoder.decode(type.self, from: data) else { return nil }
        
        return response
    }
}
