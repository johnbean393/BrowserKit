// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "BrowserKit",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "BrowserKit",
            targets: ["BrowserKit"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/scinfu/SwiftSoup.git", exact: "2.6.0"),
        .package(url: "https://github.com/SwiftUIX/SwiftUIX.git", branch: "master"),
        .package(url: "https://github.com/vmanot/CorePersistence.git", .revisionItem("38fd5271fa906a2d8395e4b42724142886a3c763")),
        .package(url: "https://github.com/johnbean393/NetworkKit.git", branch: "master"),
        .package(url: "https://github.com/vmanot/Swallow.git", branch: "master"),
    ],
    targets: [
        .target(
            name: "BrowserKit",
            dependencies: [
                "CorePersistence",
                "NetworkKit",
                "Swallow",
                "SwiftSoup",
                "SwiftUIX",
            ],
            path: "Sources",
            resources: [.process("Resources")],
            swiftSettings: [
                .enableExperimentalFeature("AccessLevelOnImport")
            ]
        ),
        .testTarget(
            name: "BrowserKitTests",
            dependencies: [
                "BrowserKit"
            ],
            path: "Tests"
        )
    ]
)
