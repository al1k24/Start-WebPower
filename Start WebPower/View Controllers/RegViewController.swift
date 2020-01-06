//
//  RegViewController.swift
//  Start WebPower
//
//  Created by Алик on 12/27/19.
//  Copyright © 2019 ALIK MOLDOVANU. All rights reserved.
//

import UIKit

class RegViewController: UIViewController {

    @IBOutlet var regInputView: UIView!
    
    @IBOutlet var regButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        regInputView.layer.cornerRadius = 10
        regInputView.clipsToBounds = true
        
        regButton.layer.cornerRadius = 10
        regButton.clipsToBounds = true
    }
    
    @IBAction func regViewCloseButtonTap(_ sender: UIBarButtonItem) {
        //navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}

