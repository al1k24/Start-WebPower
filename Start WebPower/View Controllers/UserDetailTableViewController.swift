//
//  UserDetailTableViewController.swift
//  Start WebPower
//
//  Created by Алик on 1/1/20.
//  Copyright © 2020 ALIK MOLDOVANU. All rights reserved.
//

import UIKit

class UserDetailTableViewController: UITableViewController {
    
    @IBOutlet private var userImageView: WebImageView!
    @IBOutlet private var imageActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet private var userAgeLabel: UILabel!
    @IBOutlet private var userNameLabel: UILabel!
    @IBOutlet private var userActivityLabel: UILabel!
    
    @IBOutlet private var userEmailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        updateUserInfoUI()
    }
    
    @IBAction func logOutButtonTap(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension UserDetailTableViewController {
    
    private func setupUI() {
        userImageView.layer.cornerRadius = userImageView.frame.size.width / 2
        userImageView.clipsToBounds = true
        
        imageActivityIndicator.hidesWhenStopped = true
    }
    
    private func updateUserInfoUI() {
        imageActivityIndicator.startAnimating()
        
        UserService.shared.getUserInfo { [weak self] (userInfo) in
            self?.configure(with: userInfo)
        }
    }
    
    private func configure(with userInfo: UserInfoResponse) {
        userNameLabel.text = userInfo.name
        userActivityLabel.text = userInfo.activity
        
        userAgeLabel.text = formatAge(userInfo.age)
        
        userEmailButton.setTitle(userInfo.mail, for: .normal)
        
        userImageView.set(imageURL: userInfo.image) { [weak self] in
            self?.imageActivityIndicator.stopAnimating()
        }
    }
    
    private func formatAge(_ age: Int) -> String {
        switch age % 10 {
            case 1:
                return "\(age) год"
            case 2...4:
                return "\(age) года"
            default:
                return "\(age) лет"
        }
    }
}
