import ProjectDescription

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
    ],
    fileHeaderTemplate: nil,
    additionalFiles: [],
    resourceSynthesizers: []
)
