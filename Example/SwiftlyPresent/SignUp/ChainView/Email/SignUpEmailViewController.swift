//
//  SignUpViewController.swift
//  SwiftlyPresent_Example
//
//  Created by saeng lin on 2022/03/25.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import SwiftlyPresent
import CombineCocoa
import Combine

extension SignUpEmailViewController {
    static func instance() -> SignUpEmailViewController {
        let viewController = SignUpEmailViewController(nibName: nil, bundle: nil)
        return viewController
    }
}

class SignUpEmailViewController: RootViewController, SwiftlyPresentable {
    
    typealias SwiftlyData = String
    
    lazy var signUpEmailView: SignUpEmailView = .init(frame: view.bounds)
    
    lazy var closeButton: UIBarButtonItem = {
        let navigationItem = UIBarButtonItem.init(title: "close", style: .plain, target: self, action: #selector(actionToClose))
        return navigationItem
    }()

    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - setup
    override func setup() {
        super.setup()
        
        title = "회원가입 (1/2)"
        view = signUpEmailView
        
        self.navigationItem.rightBarButtonItems = [closeButton]

    }
    
    // MARK: - bind
    override func bind() {
        super.bind()
        
        signUpEmailView.textFieldView.textPublisher
            .sink { [weak self] text in
                guard let self = self else { return }
                self.signUpEmailView.nextButton.isEnabled = (text?.count ?? 0) != 0
            }.store(in: &cancellables)
        
        signUpEmailView.nextButton.tapPublisher
            .map { [weak self] _ -> String? in
                guard let self = self else { return nil }
                return self.signUpEmailView.textFieldView.text
            }
            .sink { [weak self] promiseData in
                guard let self = self else { return }
                self.presentSubject?.send(promiseData ?? "")
            }.store(in: &cancellables)
    }
    
    @objc
    private func actionToClose() {
        self.dismiss(animated: true) { [weak self] in
            self?.presentSubject?.send(completion: .finished)
        }
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
