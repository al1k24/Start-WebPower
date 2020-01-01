//
//  UserInfoResponse.swift
//  Start WebPower
//
//  Created by Алик on 1/1/20.
//  Copyright © 2020 ALIK MOLDOVANU. All rights reserved.
//

import Foundation

struct UserInfoResponse {
    let name: String
    let activity: String
    let age: Int
    let mail: String
    let image: String
}

extension UserInfoResponse: Decodable {
    private enum UserInfoCodingKeys: String, CodingKey {
        case name
        case activity
        case age
        case mail = "e-mail"
        case image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserInfoCodingKeys.self)

        self.name = try container.decode(String.self, forKey: .name)
        self.activity = try container.decode(String.self, forKey: .activity)
        self.age = try container.decode(Int.self, forKey: .age)
        self.mail = try container.decode(String.self, forKey: .mail)
        self.image = try container.decode(String.self, forKey: .image)
    }
}
