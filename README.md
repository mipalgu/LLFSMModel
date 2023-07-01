# LLFSMModel
[![MacOS Monterey Swift Debug CI](https://github.com/mipalgu/LLFSMModel/actions/workflows/ci-macOS-debug.yml/badge.svg)](https://github.com/mipalgu/LLFSMModel/actions/workflows/ci-macOS-debug.yml)
[![MacOS Monterey Swift Release CI](https://github.com/mipalgu/LLFSMModel/actions/workflows/ci-macOS-release.yml/badge.svg)](https://github.com/mipalgu/LLFSMModel/actions/workflows/ci-macOS-release.yml)
[![Swift Coverage Test](https://github.com/mipalgu/LLFSMModel/actions/workflows/cov.yml/badge.svg)](https://github.com/mipalgu/LLFSMModel/actions/workflows/cov.yml)
[![Swift Lint](https://github.com/mipalgu/LLFSMModel/actions/workflows/swiftlint.yml/badge.svg)](https://github.com/mipalgu/LLFSMModel/actions/workflows/swiftlint.yml)
[![Ubuntu 20.04 Swift Debug CI](https://github.com/mipalgu/LLFSMModel/actions/workflows/ci-linux-debug.yml/badge.svg)](https://github.com/mipalgu/LLFSMModel/actions/workflows/ci-linux-debug.yml)
[![Ubuntu 20.04 Swift Release CI](https://github.com/mipalgu/LLFSMModel/actions/workflows/ci-linux-release.yml/badge.svg)](https://github.com/mipalgu/LLFSMModel/actions/workflows/ci-linux-release.yml)
[![Ubuntu 22.04 Swift Debug CI](https://github.com/mipalgu/LLFSMModel/actions/workflows/ci-linux-debug-22_04.yml/badge.svg)](https://github.com/mipalgu/LLFSMModel/actions/workflows/ci-linux-debug-22_04.yml)
[![Ubuntu 22.04 Swift Release CI](https://github.com/mipalgu/LLFSMModel/actions/workflows/ci-linux-release-22_04.yml/badge.svg)](https://github.com/mipalgu/LLFSMModel/actions/workflows/ci-linux-release-22_04.yml)
[![MacOS Ventura Swift Debug CI](https://github.com/mipalgu/LLFSMModel/actions/workflows/ci-macOS13-debug.yml/badge.svg)](https://github.com/mipalgu/LLFSMModel/actions/workflows/ci-macOS13-debug.yml)
[![MacOS Ventura Swift Release CI](https://github.com/mipalgu/LLFSMModel/actions/workflows/ci-macOS13-release.yml/badge.svg)](https://github.com/mipalgu/LLFSMModel/actions/workflows/ci-macOS13-release.yml)

An `LLFSM` model written in `Swift` that is compatible with other language implementations. These models
convey the basic structure within a machine without type-information or programming language constructs. All
of these models are `Codable` and can be integrated into other languages through external data formats such
as `JSON`.

Please visit our [documentation website](https://mipalgu.github.io/LLFSMModel/) for the latest changes in
this repository.

## Requirements
- Swift 5.7 or later.

## Supported Platforms
- macOS 12 or later.
- Linux (Ubuntu 20.04 or later).
- Windows through WSL (Ubuntu 20.04 or later).

## Usage
To include this package in your projects, it is preferred that you use the Swift Package Manager. Please add
the following lines to your `Package.swift`.

```swift
// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "MyPackage",
    products: [
        .library(
            name: "MyPackage",
            targets: ["MyPackage"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mipalgu/LLFSMModel", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "MyPackage",
            dependencies: ["LLFSMModel"]),
        .testTarget(
            name: "MyPackageTests",
            dependencies: ["MyPackage", "LLFSMModel"]),
    ]
)
```

You may then read the contents of these models in your Swift programs. For example, consider a `Machine` that
is defined in a `JSON` file. You may interpret this file by using the code below.

```swift
import Foundation
import LLFSMModel

let url = URL(fileURLWithPath: "<url_path>.json", isDirectory: false)
guard let data = Data(contentsOf: url) else {
    // Error!
    return
}
let decoder = JSONDecoder()
let machine = try decoder.decode(Machine.self, from: data)
print(machine.name)
```
