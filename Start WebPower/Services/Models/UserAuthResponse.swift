//
//  UserAuthResponse.swift
//  Start WebPower
//
//  Created by Алик on 1/1/20.
//  Copyright © 2020 ALIK MOLDOVANU. All rights reserved.
//

import Foundation

struct UserAuthResponse {
    let error: String?
    let success: String?
}

extension UserAuthResponse: Decodable {
    private enum UserAuthCodingKeys: String, CodingKey {
        case error
        case success
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserAuthCodingKeys.self)

        self.error = try? container.decode(String.self, forKey: .error)
        self.success = try? container.decode(String.self, forKey: .success)
    }
}
