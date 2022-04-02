//
//  SwiftlyPresentable.swift
//  Pods-SwiftlyPresent_Example
//
//  Created by saeng lin on 2022/03/25.
//

import UIKit
import Combine

private var complieteSubjectAssociatedObjectKey: Void?
public protocol SwiftlyPresentable where Self: UIViewController {
    associatedtype SwiftlyData
}

extension SwiftlyPresentable {
    public private(set) var presentSubject: PassthroughSubject<SwiftlyData, Error>? {
        set { objc_setAssociatedObject(self, &complieteSubjectAssociatedObjectKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
        get { return objc_getAssociatedObject(self, &complieteSubjectAssociatedObjectKey) as? PassthroughSubject<SwiftlyData, Error> }
    }
    
    public func presented(
        on: UIViewController,
        animated flag: Bool = true,
        completion: (() -> Void)? = nil
    ) -> AnyPublisher<SwiftlyData, Error> {
        
        if presentSubject == nil {
            presentSubject = .init()
        }
        
        on.present(self, animated: flag, completion: completion)
        return presentSubject?.eraseToAnyPublisher() ?? Empty().eraseToAnyPublisher()
    }
    
    public func presentedWithNavigation(
        on: UIViewController,
        animated flag: Bool = true,
        completion: (() -> Void)? = nil
    ) -> AnyPublisher<SwiftlyData, Error> {
        
        if presentSubject == nil {
            presentSubject = .init()
        }
        
        let navigationController = UINavigationController(rootViewController: self)
        navigationController.modalPresentationStyle = .fullScreen
        on.present(navigationController, animated: flag, completion: completion)
        
        return presentSubject?.eraseToAnyPublisher() ?? Empty().eraseToAnyPublisher()
    }
    
    public func dismiss(animated flag: Bool, promiseData: SwiftlyData) {
        dismiss(animated: flag) { [weak self] in
            self?.presentSubject?.send(promiseData)
            self?.presentSubject?.send(completion: .finished)
            self?.presentSubject = nil
        }
    }
    
    public func pushViewController(animated: Bool) -> AnyPublisher<SwiftlyData, Error> {
        
        if presentSubject == nil {
            presentSubject = .init()
        }
        
        UIApplication.shared.windows.first?.topViewController()?.navigationController?.pushViewController(self, animated: true)
        
        return presentSubject?.eraseToAnyPublisher() ?? Empty().eraseToAnyPublisher()
    }
    
    public func popViewController(
        animated: Bool,
        promiseData: SwiftlyData
    ) -> AnyPublisher<SwiftlyData, Error> {
        
        UIApplication.shared.windows.first?.topViewController()?.navigationController?.popViewController(animated: animated) { [weak self] in
            self?.presentSubject?.send(promiseData)
            self?.presentSubject?.send(completion: .finished)
            self?.presentSubject = nil
        }
        
        return presentSubject?.eraseToAnyPublisher() ?? Empty().eraseToAnyPublisher()
    }
}

extension UINavigationController {
    
    public func pushViewController(viewController: UIViewController,
                                   animated: Bool,
                                   completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    public func popViewController(animated: Bool, completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: animated)
        CATransaction.commit()
    }
    
}

extension UIWindow {
    func topViewController() -> UIViewController? {
        var top = self.rootViewController
        while true {
            if let presented = top?.presentedViewController {
                top = presented
            } else if let nav = top as? UINavigationController {
                top = nav.visibleViewController
            } else if let tab = top as? UITabBarController {
                top = tab.selectedViewController
            } else {
                break
            }
        }
        return top
    }
}
