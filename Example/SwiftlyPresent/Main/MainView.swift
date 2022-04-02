//
//  MainView.swift
//  SwiftlyPresent_Example
//
//  Created by saeng lin on 2022/03/25.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

class MainView: RootView {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    
    lazy var signUpButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("SingleView", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 25
        btn.backgroundColor = .black
        return btn
    }()
    
    lazy var chainButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Chain Present", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 25
        btn.backgroundColor = .black
        return btn
    }()
    
    private lazy var totalStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    
    private lazy var emailStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    
    private lazy var titleName: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "email: "
        label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailName: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = ""
        label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var passwordStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    
    private lazy var passWordTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "password: "
        label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    lazy var passWordName: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = ""
        label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    override func setup() {
        super.setup()
        
        addSubviews(totalStackView, stackView)
        
        totalStackView.addArrangedSubview(emailStackView)
        totalStackView.addArrangedSubview(passwordStackView)
        
        emailStackView.addArrangedSubview(titleName)
        emailStackView.addArrangedSubview(emailName)
        
        passwordStackView.addArrangedSubview(passWordTitle)
        passwordStackView.addArrangedSubview(passWordName)
        
        stackView.addArrangedSubview(signUpButton)
        stackView.addArrangedSubview(chainButton)
    }
    
    override func setupUI() {
        super.setupUI()
        
        NSLayoutConstraint.activate([
            totalStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            totalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            totalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            totalStackView.heightAnchor.constraint(equalToConstant: 200)
        ])
            
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -15),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            stackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
