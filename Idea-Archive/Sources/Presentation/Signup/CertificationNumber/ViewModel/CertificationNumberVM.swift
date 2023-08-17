import UIKit
import Moya

class CertificationNumberVM {
    let authProvider = MoyaProvider<EmailServices>()
}

extension CertificationNumberVM {
    
    func CheckCertificationNumber(email: String, authKey: String) {
        
        let param = CheckCertificationNumberRequest(email: email, authKey: authKey)
        
        authProvider.request(
            .checkCertificationNumber(checkCertificationNumberRequest: param)) { response in
            
            switch response {
            case .success(let result):
                
                do {
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
