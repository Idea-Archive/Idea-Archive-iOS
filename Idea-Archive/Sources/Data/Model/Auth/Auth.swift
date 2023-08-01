import Foundation

struct LoginResponse: Codable {
    let accessToken: String
    let refreshToken: String
    let expiredAt: String
}

struct RefreshTokenResponse: Codable {
    let accessToken: String
    let refreshToken: String
    let expiredAt: String
}
