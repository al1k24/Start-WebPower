//
//  String + Extention.swift
//  Start WebPower
//
//  Created by Алик on 1/10/20.
//  Copyright © 2020 ALIK MOLDOVANU. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
