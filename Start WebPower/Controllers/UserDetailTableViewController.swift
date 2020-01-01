//
//  UserDetailTableViewController.swift
//  Start WebPower
//
//  Created by Алик on 1/1/20.
//  Copyright © 2020 ALIK MOLDOVANU. All rights reserved.
//

import UIKit

class UserDetailTableViewController: UITableViewController {
    
    @IBOutlet var userImageView: UIImageView!
    
    @IBOutlet var userAgeLabel: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var userActivityLabel: UILabel!
    
    @IBOutlet var userEmailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel.text = "Serii Zaebali4"
        userAgeLabel.text = "26"
        userActivityLabel.text = "Tra ta ta ta ta"

        userImageView.layer.cornerRadius = userImageView.frame.size.width / 2
        userImageView.clipsToBounds = true
    }

}
