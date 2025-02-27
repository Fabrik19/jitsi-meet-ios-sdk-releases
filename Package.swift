// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "JitsiMeetSDK",
    platforms: [
         .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "JitsiMeetSDK",
            targets: ["JitsiMeetSDK", "Deps"]
            
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/Giphy/giphy-ios-sdk", .exact("2.1.20")),
        .package(name: "WebRTC", url: "https://github.com/jitsi/webrtc", .exact("106.0.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Deps",
            dependencies: [
                .product(name: "GiphyUISDK", package: "giphy-ios-sdk"),
                "WebRTC"
            ]
        ),
        .binaryTarget(
            name: "JitsiMeetSDK",
            path: "Frameworks/JitsiMeetSDK.xcframework"
        )
    ]
)
