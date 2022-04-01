//
//  SignUpView.swift
//  SwiftlyPresent_Example
//
//  Created by saeng lin on 2022/03/25.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class SignUpPassWordView: RootView {
    
    // MARK: - title properties
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "비밀번호"
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
        textField.placeholder = "비밀번호을 입력해주세요"
        return textField
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("close", for: .normal)
        button.tintColor = .black
        button.backgroundColor = UIColor(red: 255/255, green: 216/255, blue: 43/255, alpha: 1.0)
        return button
    }()
    
    // MARK: - setup
    override func setup() {
        super.setup()
        
        addSubviews(titleLabel, formView, nextButton)
        
        formView.addSubviews(textFieldView)
    }
    
    // MARK: - setupUI
    override func setupUI() {
        super.setupUI()
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 21),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            formView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            formView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            formView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            formView.heightAnchor.constraint(equalToConstant: 42),
            
            textFieldView.topAnchor.constraint(equalTo: formView.topAnchor, constant: -5),
            textFieldView.leadingAnchor.constraint(equalTo: formView.leadingAnchor, constant: 5),
            textFieldView.trailingAnchor.constraint(equalTo: formView.trailingAnchor, constant: -5),
            textFieldView.bottomAnchor.constraint(equalTo: formView.bottomAnchor, constant: 5),
            
            nextButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            nextButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 53)
        ])

    }
}
