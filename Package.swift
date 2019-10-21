// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "FCMainClient",
    platforms: [.iOS(.v8)],
    products: [
        .library(name: "MXSegmentedControl",
                 targets: ["MXSegmentedControl"])
    ],
    targets: [
        .target(
            name: "MXSegmentedControl",
            path: "MXSegmentedControl"
        )
    ],
    swiftLanguageVersions: [.v5,.v4]
)
