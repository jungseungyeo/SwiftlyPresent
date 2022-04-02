//
//  MainViewController.swift
//  SwiftlyPresent_Example
//
//  Created by saeng lin on 2022/03/25.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import Combine
import CombineCocoa

class MainViewController: RootViewController {
    
    private lazy var mainView: MainView = .init(frame: view.bounds)
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - SetUP
    override func setup() {
        super.setup()
        
        view = mainView
    }
    
    // MARK: - Bind
    override func bind() {
        super.bind()
        
        // MARK: - Single view
        mainView.signUpButton.tapPublisher
            .flatMap { [unowned self] _ in
                return SignUpViewController.instance().presentedWithNavigation(on: self).eraseToAnyPublisher()
            }.sink { [weak self] model in
                guard let self = self else { return }
                self.mainView.emailName.text = model.name
                self.mainView.passWordName.text = model.password
            }.store(in: &cancellables)

        // MARK: - ChainPresent
        mainView.chainButton.tapPublisher
            .flatMap { [unowned self] _ in
                // Email화면
                return SignUpEmailViewController.instance().presentedWithNavigation(on: self).eraseToAnyPublisher()
            }.flatMap { promiseData in
                // password 화면
                return SignUpPassWordViewController.instance(data: promiseData).pushViewController(animated: true).eraseToAnyPublisher()
            }.sink { [weak self] model in
                guard let self = self else { return }
                self.mainView.emailName.text = model.name
                self.mainView.passWordName.text = model.password
            }.store(in: &cancellables)
    }
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
