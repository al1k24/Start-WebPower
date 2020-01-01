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
        
        userImageView.layer.cornerRadius = userImageView.frame.size.width / 2
        userImageView.clipsToBounds = true
    }

    //HARD HARD HARD :D
    @IBAction func testUpdate(_ sender: UIBarButtonItem) {
        print(#function)
        UserService.shared.getUserInfo { [weak self] (user) in
            guard let self = self else { return }
            
            self.userNameLabel.text = user.name
            self.userAgeLabel.text = "\(user.age) лет" //форматирование сделать правильное
            self.userActivityLabel.text = user.activity
            
            
            print(user.mail)
            
            self.userEmailButton.setTitle(user.mail, for: .normal)
        }
    }
}
