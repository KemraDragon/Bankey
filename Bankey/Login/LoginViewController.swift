//
//  ViewController.swift
//  Bankey
//
//  Created by Kevin on 20-01-25.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    let titleLabel = UILabel()
    let titleLabel2 = UILabel()
    
    
    var username: String? {
        return loginView.usernameTextfield.text
    }
    
    var password : String? {
        return loginView.passwordTextfield.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()

    }
}

extension LoginViewController{
    
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Iniciar Sesión", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.backgroundColor = UIColor.systemBlue
        signInButton.layer.cornerRadius = 8
        signInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Bankey"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        
        titleLabel2.translatesAutoresizingMaskIntoConstraints = false
        titleLabel2.text = "Tu fuente premium para todo lo relacionado a las finanzas."
        titleLabel2.font = UIFont.systemFont(ofSize: 16)
        titleLabel2.textColor = .darkGray
        titleLabel2.textAlignment = .center
        titleLabel2.numberOfLines = 0

    }

    private func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        view.addSubview(titleLabel)
        view.addSubview(titleLabel2)

        //titulo
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        //titulo2
        NSLayoutConstraint.activate([
            titleLabel2.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            titleLabel2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            titleLabel2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16)

        ])
        //loginView
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel2.bottomAnchor, multiplier: 3),
            loginView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            loginView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16)
        ])
        
        //Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            signInButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16)
        ])
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            errorMessageLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16)
        ])
    }
}

extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("los Campos 'Usuario / Clave' no pueden quedar vacios.")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Usuario y Clave no pueden estar en blanco")
        }
    }
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
