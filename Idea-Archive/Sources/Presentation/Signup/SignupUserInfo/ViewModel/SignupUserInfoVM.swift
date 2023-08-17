import UIKit
import Moya

class SignupUserInfoVM {
    let authProvider = MoyaProvider<AuthServices>()
}

extension SignupUserInfoVM {
    
    func signupCompleted(email: String, password: String, name: String) {
    
        let param = SignupRequest.init(email: email, password: password, name: name)
        
        authProvider.request(.signup(signupRequest: param)) { response in
            
            switch response {
            case .success(let result):
                
                do {
                } catch(let err) {
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
