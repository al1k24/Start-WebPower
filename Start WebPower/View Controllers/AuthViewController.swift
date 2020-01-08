//
//  AuthViewController.swift
//  Start WebPower
//
//  Created by Алик on 12/27/19.
//  Copyright © 2019 ALIK MOLDOVANU. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet var authButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @IBAction func authViewCloseButtonTap(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func authButtonTap(_ sender: Any) {
        
    }
}

extension AuthViewController {
    
    private func setupUI() {
        authButton.layer.cornerRadius = 10
    }
}
