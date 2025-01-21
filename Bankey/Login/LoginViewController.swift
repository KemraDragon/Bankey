//
//  ViewController.swift
//  Bankey
//
//  Created by Kevin on 20-01-25.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
       
    }
}

extension LoginViewController{
    
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
    }
        
    private func layout() {
        view.addSubview(loginView)
            
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                loginView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
                loginView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16)
        ])
    }
}

