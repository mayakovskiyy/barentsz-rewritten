// swift-tools-version: 6.3
import PackageDescription

let package = Package(
    name: "barentsz-rewritten",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(
            name: "bsz",
            targets: ["bsz"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.5.0"),
    ],
    targets: [
        .executableTarget(
            name: "bsz",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        ),
        .testTarget(
            name: "bszTests",
            dependencies: ["bsz"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
