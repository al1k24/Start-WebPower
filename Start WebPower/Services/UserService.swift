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
    
    init() {
        self.networking = NetworkService()
        self.fetcher = NetworkDataFetcher(networking: networking)
    }
    
    func getUserInfo(completion: @escaping (UserInfoResponse) -> Void) {
        fetcher.getUserInfo() { (userInfoResponse) in
            guard let user = userInfoResponse else { return }
            
            completion(user)
        }
    }
}
