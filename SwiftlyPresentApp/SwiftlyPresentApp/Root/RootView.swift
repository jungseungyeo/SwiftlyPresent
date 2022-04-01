//
//  RootView.swift
//  SwiftlyPresent_Example
//
//  Created by saeng lin on 2022/03/25.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit

class RootView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
        setupUI()
    }
    
    func setup() {
        backgroundColor = .white
    }
    
    func setupUI() {}
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
}
