//
//  UIAlertController + Extension.swift
//  Start WebPower
//
//  Created by Алик on 1/8/20.
//  Copyright © 2020 ALIK MOLDOVANU. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(with title: String, and message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
