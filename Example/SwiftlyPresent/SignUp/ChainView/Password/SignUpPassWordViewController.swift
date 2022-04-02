//
//  SignUpPassWordViewController.swift
//  SwiftlyPresent_Example
//
//  Created by saeng lin on 2022/03/26.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import SwiftlyPresent
import CombineCocoa
import Combine

extension SignUpPassWordViewController {
    static func instance(data: String) -> SignUpPassWordViewController {
        let viewController = SignUpPassWordViewController(name: data)
        return viewController
    }
}

class SignUpPassWordViewController: RootViewController, SwiftlyPresentable {
    
    typealias SwiftlyData = SignUpModel
    
    lazy var signUpPassWordView: SignUpPassWordView = .init(frame: view.bounds)
    
    lazy var closeButton: UIBarButtonItem = {
        let navigationItem = UIBarButtonItem.init(title: "close", style: .plain, target: self, action: #selector(actionToClose))
        return navigationItem
    }()
    
    private let name: String
    
    init(name: String) {
        self.name = name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - setup
    override func setup() {
        super.setup()
        title = "회원가입 (2/2)"
        view = signUpPassWordView
        
        self.navigationItem.rightBarButtonItems = [closeButton]
    }
    
    // MARK: - Bind
    override func bind() {
        super.bind()
        
        signUpPassWordView.textFieldView.textPublisher
            .sink { [weak self] text in
                guard let self = self else { return }
                self.signUpPassWordView.nextButton.isEnabled = (text?.count ?? 0) != 0
            }.store(in: &cancellables)
        
        signUpPassWordView.nextButton.tapPublisher
            .map { [weak self] _ -> String? in
                guard let self = self else { return nil }
                return self.signUpPassWordView.textFieldView.text
            }
            .sink { [weak self] promiseData in
                guard let self = self else { return }
                self.dismiss(animated: true, promiseData: .init(name: self.name, password: promiseData ?? ""))
            }.store(in: &cancellables)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc
    private func actionToClose() {
        self.dismiss(animated: true) { [weak self] in
            self?.presentSubject?.send(completion: .failure(NSError(domain: "close", code: -999, userInfo: nil)))
        }
    }
}
