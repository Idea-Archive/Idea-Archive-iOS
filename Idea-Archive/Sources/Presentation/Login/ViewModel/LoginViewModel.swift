import UIKit
import Moya

class LoginViewModel {
    let authProvider = MoyaProvider<AuthServices>()
    var authData: LoginResponse!
    
    static var accessToken = ""
}

extension LoginViewModel {
    
    func loginCompleted(email: String, password: String) {
    
        let param = LoginRequest.init(email: email, password: password)
        
        authProvider.request(.login(loginRequest: param)) { response in
            
            switch response {
            case .success(let result):
                
                do {
                    self.authData = try? result.map(LoginResponse.self)
                    
                    try KeychainManager.delete()
                    
                    try KeychainManager.save(
                        userId: param.email,
                        refreshToken: self.authData.accessToken.data(using: .utf8) ?? Data())
                }catch(let err) {
                    print(String(describing: err))
                }
                let statusCode = result.statusCode
                
                switch statusCode{
                case 200..<300:
                    print(self.authData.accessToken)
                    print("성공")
                case 400:
                    print("Login failed with status code: \(statusCode)")
                default:
                    print(statusCode)
                }
            case .failure(let err):
                print(String(describing: err))
            }
        }
    }
}

