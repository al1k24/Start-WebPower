//
//  AuthViewController.swift
//  Start WebPower
//
//  Created by Алик on 12/27/19.
//  Copyright © 2019 ALIK MOLDOVANU. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet var authInputView: UIView!
    
    @IBOutlet var authButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authInputView.layer.cornerRadius = 10
        authInputView.clipsToBounds = true
        
        authButton.layer.cornerRadius = 10
        authButton.clipsToBounds = true
    }
    
    @IBAction func authViewCloseButtonTap(_ sender: UIBarButtonItem) {
        //navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
