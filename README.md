# RuntimeLocalizable

[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

RuntimeLocalizable helps to switch your app's localization in runtime (using existing localization strings).

## Requirements

- iOS 8.0+
- Xcode 8.0+
- Swift 3.0+

## Installation

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate RuntimeLocalizable into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "MobileToolkit/RuntimeLocalizable" ~> 1.0
```

Run `carthage update` to build the framework and drag the built `RuntimeLocalizable.framework` into your Xcode project.

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate RuntimeLocalizable into your project manually.

---

## Usage

#### Selecting runtime language

```swift
import RuntimeLocalizable

Bundle.setLanguage("pl")

// now you can print it as usual
let someText = NSLocalizedString("Some example text...", comment: "")
```

#### Reseting to system language

```swift
import RuntimeLocalizable

Bundle.resetLanguage()
```

For more example usages please check the ExampleApp.

## License

RuntimeLocalizable is released under the MIT license. See LICENSE for details.
