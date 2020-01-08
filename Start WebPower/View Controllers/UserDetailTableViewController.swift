//
//  UserDetailTableViewController.swift
//  Start WebPower
//
//  Created by Алик on 1/1/20.
//  Copyright © 2020 ALIK MOLDOVANU. All rights reserved.
//

import UIKit

class UserDetailTableViewController: UITableViewController {
    
    @IBOutlet private var table: UITableView!
    
    @IBOutlet private var userImageView: WebImageView!
    @IBOutlet private var imageActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet private var userAgeLabel: UILabel!
    @IBOutlet private var userNameLabel: UILabel!
    @IBOutlet private var userActivityLabel: UILabel!
    
    @IBOutlet private var userEmailButton: UIButton!
    
    private let refreshControll: UIRefreshControl = {
        let rc = UIRefreshControl()
        rc.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        
        return rc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        updateUserInfoUI()
    }
    
    @objc private func refresh(sender: UIRefreshControl) {
        updateUserInfoUI{ sender.endRefreshing() }
    }
    
    @IBAction func updateUserInfoTableBarButtonTaped(_ sender: UIBarButtonItem) {
        updateUserInfoUI()
    }
    
}

extension UserDetailTableViewController {
    
    private func setupUI() {
        table.refreshControl = refreshControll
        
        userImageView.layer.cornerRadius = userImageView.frame.size.width / 2
        userImageView.clipsToBounds = true
        
        imageActivityIndicator.hidesWhenStopped = true
    }
    
    private func updateUserInfoUI(completion: (() -> Void)? = nil) {
        imageActivityIndicator.startAnimating()
        
        UserService.shared.getUserInfo { [weak self] (userInfo) in
            guard let self = self else { return }

            self.configure(with: userInfo)
            
            completion?()
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
            case 1: return "\(age) год"
            case 2...4: return "\(age) года"
            default: return "\(age) лет"
        }
    }
}
