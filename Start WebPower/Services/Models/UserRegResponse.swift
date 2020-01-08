//
//  UserRegResponse.swift
//  Start WebPower
//
//  Created by Алик on 1/1/20.
//  Copyright © 2020 ALIK MOLDOVANU. All rights reserved.
//

import Foundation

struct UserRegResponse {
    let error: String?
    let success: String?
}

extension UserRegResponse: Decodable {
    private enum UserRegCodingKeys: String, CodingKey {
        case error
        case success
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserRegCodingKeys.self)

        self.error = try? container.decode(String.self, forKey: .error)
        self.success = try? container.decode(String.self, forKey: .success)
    }
}
