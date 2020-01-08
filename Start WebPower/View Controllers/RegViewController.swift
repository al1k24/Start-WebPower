//
//  RegViewController.swift
//  Start WebPower
//
//  Created by Алик on 12/27/19.
//  Copyright © 2019 ALIK MOLDOVANU. All rights reserved.
//

import UIKit

class RegViewController: UIViewController {

    @IBOutlet var regButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @IBAction func regViewCloseButtonTap(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

extension RegViewController {
    
    private func setupUI() {
        regButton.layer.cornerRadius = 10
    }
}
