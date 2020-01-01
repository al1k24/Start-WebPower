//
//  HTTPMethod.swift
//  Start WebPower
//
//  Created by Алик on 1/1/20.
//  Copyright © 2020 ALIK MOLDOVANU. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}
