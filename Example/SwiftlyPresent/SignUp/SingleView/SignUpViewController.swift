//
//  SignUpViewController.swift
//  SwiftlyPresent_Example
//
//  Created by saeng lin on 2022/03/26.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import Combine
import SwiftlyPresent
import CombineCocoa

extension SignUpViewController {
    static func instance() -> SignUpViewController {
        return SignUpViewController()
    }
}

class SignUpViewController: RootViewController, SwiftlyPresentable {
    typealias SwiftlyData = SignUpModel
    
    lazy var signUpView = SignUpView(frame: view.bounds)
    
    lazy var closeButton: UIBarButtonItem = {
        let navigationItem = UIBarButtonItem.init(title: "close", style: .plain, target: self, action: #selector(actionToClose))
        return navigationItem
    }()
    
    private var cancellables = Set<AnyCancellable>()
    
    override func setup() {
        super.setup()
        
        title = "회원가입"
        view = signUpView
        
        navigationItem.rightBarButtonItems = [closeButton]
    }
    
    override func bind() {
        super.bind()

        
        Publishers.CombineLatest(signUpView.textFieldView.textPublisher, signUpView.passWordTextFieldView.textPublisher)
            .sink { [weak self] email, password in
                guard let self = self else { return }
                self.signUpView.closeButton.isEnabled = (email?.count ?? 0) != 0 && (password?.count ?? 0) != 0
            }.store(in: &cancellables)
        
        signUpView.closeButton.tapPublisher
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.dismiss(animated: true, promiseData: .init(name: self.signUpView.textFieldView.text ?? "",
                                                                password: self.signUpView.passWordTextFieldView.text ?? ""))
            }.store(in: &cancellables)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc
    private func actionToClose() {
        self.dismiss(animated: true) { [weak self] in
            self?.presentSubject?.send(completion: .finished)
        }
    }
    
    @objc
    private func actionToView() {
        self.view.endEditing(true)
    }
}
