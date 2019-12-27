//
//  AuthViewController.swift
//  Start WebPower
//
//  Created by Алик on 12/27/19.
//  Copyright © 2019 ALIK MOLDOVANU. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func authViewCloseButtonTap(_ sender: UIBarButtonItem) {
        //navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
