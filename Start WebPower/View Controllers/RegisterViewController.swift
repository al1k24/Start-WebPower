//
//  RegViewController.swift
//  Start WebPower
//
//  Created by Алик on 12/27/19.
//  Copyright © 2019 ALIK MOLDOVANU. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet private var regButton: UIButton!
    
    @IBOutlet private var authLoginTextField: UITextField!
    @IBOutlet private var authEmailTextField: UITextField!
    @IBOutlet private var authPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupKeyboard()
    }
    
    @IBAction func registerButtonTap(_ sender: Any) {
        register()
    }
    
}

extension RegisterViewController {
    
    private func setupUI() {
        regButton.layer.cornerRadius = 10
    }
    
    private func setupKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func register() {
        guard
            let login = authLoginTextField.text,
            let email = authEmailTextField.text,
            let password = authPasswordTextField.text
        else { return }
        
        UserService.shared.registerUser(login: login, email: email, password: password) { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let success):
                self.showAlert(with: "Ура", and: success)
                self.clearForm()
            case .failure(let error):
                self.showAlert(with: "Упс", and: error.localizedDescription)
            }
        }
    }
    
    private func clearForm() {
        authLoginTextField.text = ""
        authEmailTextField.text = ""
        authPasswordTextField.text = ""
    }
}
