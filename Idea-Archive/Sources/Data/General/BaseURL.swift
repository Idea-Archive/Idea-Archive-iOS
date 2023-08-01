import Foundation

enum BaseURL {
    #if DEBUG
        static let baseURL = Bundle.main.textAPIKey
    #elseif RELEASE
        static let baseURL = Bundle.main.baseAPIKey
    #endif
    
}
