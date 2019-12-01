// swift-tools-version:5.1
//
//  Package.swift
//  iOS
//
//  Created by Shane Whitehead on 17/11/19.
//  Copyright © 2019 Kaizen Enteripises. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "HttpEngineCore",
    platforms: [
			.macOS(.v10_12), .iOS(.v10), .tvOS(.v11), .watchOS(.v4)
    ],
    products: [
        .library(name: "HttpEngineCore", targets: ["HttpEngineCore"]),
    ],
    dependencies: [
			.package(url: "https://github.com/RustyKnight/Cadmus", Package.Dependency.Requirement.branch("feature/spm")),
			.package(url: "https://github.com/malcommac/Hydra.git", from: "2.0.0")
    ],
    targets: [
			.target(name: "HttpEngineCore",
							dependencies: ["Cadmus", "Hydra"],
							path: "HttpEngineCore"),
    ]
)
