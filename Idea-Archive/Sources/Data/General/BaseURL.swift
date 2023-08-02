import Foundation

enum BaseURL {
    #if DEBUG
        static let baseURL = Bundle.main.baseAPIKey
    #elseif RELEASE
        static let testURL = Bundle.main.testAPIKey
    #endif
}
