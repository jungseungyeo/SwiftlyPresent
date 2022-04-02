//
//  SignUpView.swift
//  SwiftlyPresent_Example
//
//  Created by saeng lin on 2022/03/25.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class SignUpView: RootView {
    
    // MARK: - title properties
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "이메일"
        label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var formView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 239/255)
        return view
    }()
    
    lazy var textFieldView: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "이메일을 입력해주세요"
        return textField
    }()
    
    // MARK: - password properties
    lazy var passWordTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "비밀번호"
        label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var passWordFormView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 239/255)
        return view
    }()
    
    lazy var passWordTextFieldView: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "비밀번호을 입력해주세요"
        return textField
    }()
    
    // MARK: - close propertie
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Close", for: .normal)
        button.tintColor = .black
        button.backgroundColor = UIColor(red: 255/255, green: 216/255, blue: 43/255, alpha: 1.0)
        return button
    }()
    
    
    // MARK: - setup
    override func setup() {
        super.setup()
        
        addSubviews(titleLabel, formView, closeButton, passWordTitleLabel, passWordFormView)
        
        formView.addSubviews(textFieldView)
        passWordFormView.addSubviews(passWordTextFieldView)
    }
    
    // MARK: - setupUI
    override func setupUI() {
        super.setupUI()
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 21),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
        ])
        
        NSLayoutConstraint.activate([
            formView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            formView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            formView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            formView.heightAnchor.constraint(equalToConstant: 42),
        ])
        
        NSLayoutConstraint.activate([
            textFieldView.topAnchor.constraint(equalTo: formView.topAnchor, constant: -5),
            textFieldView.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 5),
            textFieldView.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -5),
            textFieldView.bottomAnchor.constraint(equalTo: formView.bottomAnchor, constant: 5),
        ])
        
        NSLayoutConstraint.activate([
            passWordTitleLabel.topAnchor.constraint(equalTo: formView.bottomAnchor, constant: 15),
            passWordTitleLabel.leadingAnchor.constraint(equalTo: formView.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            passWordFormView.topAnchor.constraint(equalTo: passWordTitleLabel.bottomAnchor, constant: 5),
            passWordFormView.leadingAnchor.constraint(equalTo: passWordTitleLabel.leadingAnchor),
            passWordFormView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            passWordFormView.heightAnchor.constraint(equalToConstant: 42),
        ])
        
        NSLayoutConstraint.activate([
            passWordTextFieldView.topAnchor.constraint(equalTo: passWordFormView.topAnchor, constant: -5),
            passWordTextFieldView.leadingAnchor.constraint(equalTo: passWordFormView.leadingAnchor, constant: 5),
            passWordTextFieldView.trailingAnchor.constraint(equalTo: passWordFormView.trailingAnchor, constant: -5),
            passWordTextFieldView.bottomAnchor.constraint(equalTo: passWordFormView.bottomAnchor, constant: 5),
        ])
        
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            closeButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: 53)
        ])

    }
}
