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
        
        setupUI()
        updateUserInfoUI()
    }
    
    func setupUI() {
        userImageView.layer.cornerRadius = userImageView.frame.size.width / 2
        userImageView.clipsToBounds = true
    }
    
    func configure(with userInfo: UserInfoResponse) {
        userNameLabel.text = userInfo.name
        userAgeLabel.text = "\(userInfo.age) лет" //форматирование сделать правильное
        userActivityLabel.text = userInfo.activity
        
        userEmailButton.setTitle(userInfo.mail, for: .normal)
    }
    
    private func updateUserInfoUI() {
        UserService.shared.getUserInfo { [weak self] (userInfo) in
            guard let self = self else { return }

            self.configure(with: userInfo)
        }
    }
    
    @IBAction func updateUserInfoTableBarButtonTaped(_ sender: UIBarButtonItem) {
        updateUserInfoUI()
    }
    
}
