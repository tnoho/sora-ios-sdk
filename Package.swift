// swift-tools-version:5.3

import Foundation
import PackageDescription

let libwebrtcVersion = "m137.7151.3.0-ios-stereo"

let package = Package(
    name: "Sora",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "Sora", targets: ["Sora"]),
        .library(name: "WebRTC", targets: ["WebRTC"]),
    ],
    dependencies: [
        // 開発用依存関係
        // SwfitLint 公式で推奨されている SwfitLintPlugins を利用する
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.58.2")
    ],
    targets: [
        .binaryTarget(
            name: "WebRTC",
            url: "https://github.com/tnoho/webrtc-build/releases/download/\(libwebrtcVersion)/WebRTC.xcframework.zip",
            checksum: "d314a170b78ed11ad5fcf0447e28618e1c39bf1be38a3cd5a56bbb607c3c9d82"
        ),
        .target(
            name: "Sora",
            dependencies: ["WebRTC"],
            path: "Sora",
            exclude: ["Info.plist"],
            resources: [.process("VideoView.xib")]
        ),
    ]
)
