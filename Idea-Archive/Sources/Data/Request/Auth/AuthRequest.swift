import Foundation

struct SignupRequest: Encodable {
    let email: String
    let password: String
    let name: String
    
    init(email: String, password: String, name: String) {
        self.email = email
        self.password = password
        self.name = name
    }
}

struct LoginRequest: Encodable {
    let email: String
    let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
