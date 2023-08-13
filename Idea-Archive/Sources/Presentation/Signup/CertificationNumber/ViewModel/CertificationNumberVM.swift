import UIKit
import Moya

class CertificationNumberVM {
    let authProvider = MoyaProvider<AuthServices>()
}

extension CertificationNumberVM {
    
    func signupCompleted(email: String, password: String, name: String) {
    
        let param = SignupRequest.init(email: email, password: password, name: name)
        
        authProvider.request(.signup(signupRequest: param)) { response in
            
            switch response {
            case .success(let result):
                
                do {
//                    try KeychainManager.delete()
//
//                    try KeychainManager.save(
//                        userId: param.email,
//                        refreshToken: self.authData.accessToken.data(using: .utf8) ?? Data())
                }catch(let err) {
                    print(String(describing: err))
                }
                let statusCode = result.statusCode
                
                switch statusCode{
                case 200..<300:
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

