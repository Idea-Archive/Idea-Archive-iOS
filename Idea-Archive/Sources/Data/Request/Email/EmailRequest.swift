import Foundation

struct GetCertificationNumberRequest: Codable {
    let email: String
    
    init(email: String) {
        self.email = email
    }
}

struct CheckCertificationNumberRequest: Codable {
    let email: String
    let authKey: String
    
    init(email: String, authKey: String) {
        self.email = email
        self.authKey = authKey
    }
}
