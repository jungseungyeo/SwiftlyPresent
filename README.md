# SwiftlyPresent

[![CI Status](https://img.shields.io/travis/jungseungyeo/SwiftlyPresent.svg?style=flat)](https://travis-ci.org/jungseungyeo/SwiftlyPresent)
[![Version](https://img.shields.io/cocoapods/v/SwiftlyPresent.svg?style=flat)](https://cocoapods.org/pods/SwiftlyPresent)
[![License](https://img.shields.io/cocoapods/l/SwiftlyPresent.svg?style=flat)](https://cocoapods.org/pods/SwiftlyPresent)
[![Platform](https://img.shields.io/cocoapods/p/SwiftlyPresent.svg?style=flat)](https://cocoapods.org/pods/SwiftlyPresent)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SwiftlyPresent is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftlyPresent'
```

## How to use

``` Swift
// MARK: - Single view
    mainView.signUpButton.tapPublisher
        .flatMap { [unowned self] _ in
            return SignUpViewController.instance().presentedWithNavigation(on: self).eraseToAnyPublisher()
        }.sink { completion in
            switch completion {
            case .failure(let error):
                print("single close: \(error.localizedDescription)")
            case .finished: break
            }
        } receiveValue: { [weak self] model in
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
          }.sink { completion in
              switch completion {
              case .failure(let error):
                  print("chain close: \(error.localizedDescription)")
              case .finished: break
              }
          } receiveValue: { [weak self] model in
              guard let self = self else { return }
              self.mainView.emailName.text = model.name
              self.mainView.passWordName.text = model.password
          }.store(in: &cancellables)
```

## Author

jungseungyeo, duwjdtmd91@gmail.com

## License

SwiftlyPresent is available under the MIT license. See the LICENSE file for more info.
