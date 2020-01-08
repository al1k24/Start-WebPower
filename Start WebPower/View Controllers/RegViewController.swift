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
    
    @IBOutlet private var authLoginTextField: UITextField!
    @IBOutlet private var authEmailTextField: UITextField!
    @IBOutlet private var authPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    @IBAction func regViewCloseButtonTap(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func regButtonTap(_ sender: Any) {
        reg()
    }
}

extension RegViewController {
    
    private func setupUI() {
        regButton.layer.cornerRadius = 10
    }
    
    private func reg() {
        guard
            let login = authLoginTextField.text,
            let email = authEmailTextField.text,
            let password = authPasswordTextField.text
        else { return }
        
        UserService.shared.regUser(login: login, email: email, password: password) { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let success):
                self.showAlert(with: "Ура", and: success) {
//                    self.clearForm()
                }
            case .failure(let error):
                self.showAlert(with: "Упс", and: error.localizedDescription)
            }
        }
    }
}
