//
//  MainViewController.swift
//  Start WebPower
//
//  Created by Алик on 12/28/19.
//  Copyright © 2019 ALIK MOLDOVANU. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet private var appButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        for button in appButtons {
            button.layer.cornerRadius = 10
        }
    }
    
}
