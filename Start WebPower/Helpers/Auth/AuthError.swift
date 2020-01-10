//
//  AuthError.swift
//  Start WebPower
//
//  Created by Алик on 1/8/20.
//  Copyright © 2020 ALIK MOLDOVANU. All rights reserved.
//

import Foundation

enum AuthError {
    case notFilled
    case invalidEmail
    case unknownError
    case serverError
    case responseError(String)
    case invalidLenght(Int, Int)
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .invalidEmail:
            return NSLocalizedString("Введите валидную почту", comment: "")
        case .unknownError:
            return NSLocalizedString("Неизвестная ошибка", comment: "")
        case .serverError:
            return NSLocalizedString("Ошибка сервера", comment: "")
        case .responseError(let error):
            return NSLocalizedString(error, comment: "")
        case .invalidLenght(let min, let max):
            return NSLocalizedString("Учитывайте диапазон: \(min)-\(max) символов", comment: "")
        }
    }
}
