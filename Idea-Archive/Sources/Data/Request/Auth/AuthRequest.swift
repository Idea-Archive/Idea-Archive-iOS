import Foundation

struct SignupRequest: Codable {
    let email: String
    let password: String
    let name: String
    
    init(email: String, password: String, name: String) {
        self.email = email
        self.password = password
        self.name = name
    }
}

struct LoginRequest: Codable {
    let email: String
    let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

struct LogoutRequest: Codable {
    let accessToken: String
    
    init(accessToken: String) {
        self.accessToken = accessToken
    }
}

struct RefreshTokenRequest: Codable {
    let refreshToken: String
    
    init(refreshToken: String) {
        self.refreshToken = refreshToken
    }
}
