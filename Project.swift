import ProjectDescription

<<<<<<< Updated upstream
// MARK: Constants
let projectName = "Idea-Archive"
let organizationName = "Idea-Archive-iOS"
let bundleID = "class.Idea-Archive"
let targetVersion = "3.19.0"

// MARK: Struct
let project = Project(
    name: projectName,
    organizationName: organizationName,
    settings: nil,
    packages: [],
    targets: [
        Target(name: projectName,
               platform: .iOS,
               product: .app,
               bundleId: bundleID,
               deploymentTarget: .iOS(targetVersion: targetVersion, devices: [.iphone, .ipad]),
               infoPlist: .default,
               sources: ["\(projectName)/**"],
               resources: [],
               dependencies: []
              )
    ],
    schemes: [
        Scheme(name: "\(projectName)-debug"),
        Scheme(name: "\(projectName)-Release")
=======
let projectName = "Idea-Archive"
let orginazationIden = ".class"

let project = Project(
    name: projectName,
    organizationName: "\(projectName)-iOS",
    packages: [
        .remote(
            url: "https://github.com/hackiftekhar/IQKeyboardManager.git",
            requirement: .upToNextMajor(from: "6.5.0")
        ),
        .remote(
            url: "https://github.com/SnapKit/SnapKit.git",
            requirement: .upToNextMajor(from: "5.0.1")
        ),
        .remote(
            url: "https://github.com/Moya/Moya.git",
            requirement: .upToNextMajor(from: "15.0.0")
        ),
        .remote(
            url: "https://github.com/RxSwiftCommunity/RxKeyboard.git",
            requirement: .upToNextMajor(from: "2.0.1")
        ),
        .remote(
            url: "https://github.com/devxoul/Then",
            requirement: .upToNextMajor(from: "2")
        ),
    ],
    settings: nil,
    targets: [
        Target(
            name: projectName,
            platform: .iOS,
            product: .app,
            bundleId: "\(orginazationIden).\(projectName)",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone, .ipad]),
            infoPlist: .file(path: Path("\(projectName)/Support/Info.plist")),
            sources: ["\(projectName)/Sources/**"],
            resources: ["\(projectName)/Resources/**"],
            dependencies: [
                .package(product: "IQKeyboardManager"),
                .package(product: "SnapKit"),
                .package(product: "Moya"),
                .package(product: "RxKeyboard"),
                .package(product: "Then")
            ]
        )
>>>>>>> Stashed changes
    ],
    fileHeaderTemplate: nil,
    additionalFiles: [],
    resourceSynthesizers: []
)
