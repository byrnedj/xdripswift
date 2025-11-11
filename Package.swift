// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "xDripSwift",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "xDripSwift",
            targets: ["xDripSwift"]
        )
    ],
    targets: [
        .target(
            name: "xDripObjC",
            path: "xdrip",
            sources: [
                "BluetoothTransmitter/CGM/Dexcom/Generic/AESCrypt.m",
                "Utilities/CustomColoredDisclosureIndicator/DTCustomColoredAccessory.m"
            ],
            publicHeadersPath: "ObjCInclude",
            cSettings: [
                .headerSearchPath("BluetoothTransmitter/CGM/Dexcom/Generic"),
                .headerSearchPath("Utilities/CustomColoredDisclosureIndicator")
            ],
            linkerSettings: [
                .linkedLibrary("CommonCrypto")
            ]
        ),
        .target(
            name: "xDripSwift",
            dependencies: [
                "xDripObjC"
            ],
            path: "xdrip",
            exclude: [
                "ObjCInclude",
                "xdrip-Bridging-Header.h",
                "xDrip.xcconfig",
                "Version.xcconfig",
                "xdrip.entitlements",
                "xdripDebug.entitlements",
                "BluetoothTransmitter/CGM/Dexcom/Generic/AESCrypt.h",
                "BluetoothTransmitter/CGM/Dexcom/Generic/AESCrypt.m",
                "Utilities/CustomColoredDisclosureIndicator/DTCustomColoredAccessory.h",
                "Utilities/CustomColoredDisclosureIndicator/DTCustomColoredAccessory.m",
                "Supporting Files",
                "Core Data/README.md",
                "Core Data/accessors/README.md"
            ],
            resources: [
                .process("Resources"),
                .process("Storyboards"),
                .process("Core Data")
            ]
        )
    ]
)
