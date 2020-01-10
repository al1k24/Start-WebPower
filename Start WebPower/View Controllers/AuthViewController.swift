//
//  AuthViewController.swift
//  Start WebPower
//
//  Created by Алик on 12/27/19.
//  Copyright © 2019 ALIK MOLDOVANU. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet private var authButton: UIButton!
    
    @IBOutlet private var authLoginTextField: UITextField!
    @IBOutlet private var authPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupKeyboard()
    }
    
    @IBAction func authButtonTap(_ sender: Any) {
        auth()
    }
}

extension AuthViewController {
    
    private func setupUI() {
        authButton.layer.cornerRadius = 10
    }
    
    private func setupKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func auth() {
        guard
            let login = authLoginTextField.text,
            let password = authPasswordTextField.text
            else { return }
        
        UserService.shared.authUser(login: login, password: password) { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(_):
                self.performSegue(withIdentifier: "userDetailSegue", sender: nil)
                self.clearForm()
            case .failure(let error):
                self.showAlert(with: "Упс", and: error.localizedDescription)
            }
        }
    }
    
    private func clearForm() {
        authLoginTextField.text = ""
        authPasswordTextField.text = ""
    }
}
