// swift-tools-version:5.3
import PackageDescription

private let name = "PredicateBuilder"
private let targetName = name

let package = Package(
    name: name,
    products: [
        .library(name: name, targets: [targetName]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: targetName,
            path: "PredicateBuilder/src",
            sources: ["PredicateBuilder.swift", "String+PredicateBuilder.swift"]
        )
    ]
)
