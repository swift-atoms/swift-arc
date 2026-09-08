// swift-tools-version: 6.4
import PackageDescription
let package = Package(
    name: "swift-arc",
    platforms: [.macOS(.v27), .iOS(.v27), .tvOS(.v27), .watchOS(.v27), .visionOS(.v27)],
    products: [.library(name: "Arc", targets: ["Arc"])],
    dependencies: [
        .package(url: "https://github.com/swift-atoms/swift-magnitude.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-angle.git", branch: "main"),
    ],
    targets: [
        .target(name: "Arc", dependencies: [
            .product(name: "Magnitude", package: "swift-magnitude"),
            .product(name: "Angle", package: "swift-angle"),
        ]),
        .testTarget(name: "Arc Tests", dependencies: [.target(name: "Arc")]),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
