import Foundation

struct LoginResponse: Codable {
    let accessToken: String
    let refreshToken: String
    let expiredAt: String
}

//struct LogoutModel: Codable {
//    let header: String
//}
//
//struct LoginResponse: Codable {
//    let accessToken: String
//}
