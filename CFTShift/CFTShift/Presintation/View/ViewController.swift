//
//  ViewController.swift
//  CFTShift
//
//  Created by Виталий Багаутдинов on 01.07.2025.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    private let nameTextField = UITextField()
    private let surnameTextField = UITextField()
    private let birthDatePicker = UIDatePicker()
    private let passwordTextField = UITextField()
    private let confirmPasswordTextField = UITextField()
    private let registerButton = UIButton(type: .system)
    private let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        setupActions()
        validateFields()
    }
    
    private func setupUI() {
        nameTextField.placeholder = "Имя"
        nameTextField.borderStyle = .roundedRect
        surnameTextField.placeholder = "Фамилия"
        surnameTextField.borderStyle = .roundedRect
        
        birthDatePicker.datePickerMode = .date
        birthDatePicker.preferredDatePickerStyle = .compact
        
        passwordTextField.placeholder = "Пароль"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        confirmPasswordTextField.placeholder = "Подтвердите пароль"
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.borderStyle = .roundedRect
        
        registerButton.setTitle("Регистрация", for: .normal)
        registerButton.isEnabled = false
        registerButton.backgroundColor = .systemBlue
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.cornerRadius = 8
        
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(surnameTextField)
        stackView.addArrangedSubview(birthDatePicker)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(confirmPasswordTextField)
        stackView.addArrangedSubview(registerButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            nameTextField.heightAnchor.constraint(equalToConstant: 44),
            surnameTextField.heightAnchor.constraint(equalToConstant: 44),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 44),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupActions() {
        nameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        surnameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        confirmPasswordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        birthDatePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
    }
    
    @objc private func textFieldChanged() {
        validateFields()
    }
    
    @objc private func dateChanged() {
        validateFields()
    }
    
    private func validateFields() {
        let allFieldsFilled =
            !(nameTextField.text ?? "").isEmpty &&
            !(surnameTextField.text ?? "").isEmpty &&
            !(passwordTextField.text ?? "").isEmpty &&
            !(confirmPasswordTextField.text ?? "").isEmpty
        registerButton.isEnabled = allFieldsFilled
        registerButton.backgroundColor = registerButton.isEnabled ? .systemBlue : .systemGray
    }
    
    @objc private func registerTapped() {
        let name = nameTextField.text ?? ""
        let surname = surnameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let confirmPassword = confirmPasswordTextField.text ?? ""
        
        if let error = RegisterDI.make().validateAndSaveUser(name: name, surname: surname, password: password, confirmPassword: confirmPassword) {
            let alert = UIAlertController(title: "Ошибка", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        let hostingController = UIHostingController(rootView: HomeView(rvm: RegisterDI.make()))
        hostingController.modalPresentationStyle = .fullScreen
        present(hostingController, animated: true)
    }
}

