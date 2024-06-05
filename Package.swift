// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "MediaPipeTasksVision",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "MediaPipeTasksVision",
            type: .static,
            targets: ["MediaPipeTasksVisionTargets"]
        )
    ],
    dependencies: [
        .package(path: "../mediapipe-tasks-common-sp")
    ],
    targets: [
        .binaryTarget(
            name: "MediaPipeTasksVision",
            path: "MediaPipeTasksVision/frameworks/MediaPipeTasksVision.xcframework"
        ),
        .target(
            name: "MediaPipeTasksVisionTargets",
            dependencies: [
                .target(name: "MediaPipeTasksVision"),
                .product(name: "MediaPipeTasksCommon", package: "mediapipe-tasks-common-sp"),
            ],
            linkerSettings: [
                .linkedLibrary("c++")
            ]
        )
    ]
)
