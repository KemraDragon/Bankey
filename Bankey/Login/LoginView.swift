//
//  LoginView.swift
//  Bankey
//
//  Created by Kevin on 20-01-25.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    let stackview = UIStackView()
    let usernameTextfield = UITextField()
    let passwordTextfield = UITextField()
    let dividerView = UIView()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LoginView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .red
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 8
        
        usernameTextfield.translatesAutoresizingMaskIntoConstraints = false
        usernameTextfield.placeholder = "Usuario"
        usernameTextfield.delegate = self
        
        passwordTextfield.translatesAutoresizingMaskIntoConstraints = false
        passwordTextfield.placeholder = "Clave"
        passwordTextfield.isSecureTextEntry = true
        passwordTextfield.delegate = self
        
        dividerView.translatesAutoresizingMaskIntoConstraints = true
        dividerView.backgroundColor = .secondarySystemFill
    }
    
    func layout() {
        
        stackview.addArrangedSubview(usernameTextfield)
        stackview.addArrangedSubview(passwordTextfield)
        
        addSubview(stackview)
        
        NSLayoutConstraint.activate([
        stackview.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
        stackview.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
        trailingAnchor.constraint(equalToSystemSpacingAfter: stackview.trailingAnchor, multiplier: 1),
        bottomAnchor.constraint(equalToSystemSpacingBelow: stackview.bottomAnchor, multiplier: 1)
        ])
    }
}

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextfield.endEditing(true)
        passwordTextfield.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        } else {
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}
