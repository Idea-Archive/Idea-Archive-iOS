import Foundation
import Moya

enum EmailServices {
    case getCertificationNumber(param: GetCertificationNumberRequest)
    case checkCertificationNumber(param: CheckCertificationNumberRequest)
}
extension EmailServices: TargetType {
    
    public var baseURL: URL {
        return URL(string: BaseURL.baseURL + "/email")!
    }
    
    var path: String {
        switch self {
        case .getCertificationNumber:
            return "/send"
        case .checkCertificationNumber:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCertificationNumber:
            return .post
        case .checkCertificationNumber:
            return .head
        }
    }
    
    var sampleData: Data {
        return "@@".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .getCertificationNumber(let param):
            let params : [String: String] = [
                "email" : param.email
            ]
            return .requestJSONEncodable(params)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .checkCertificationNumber(let param):
            return [
                "email": param.email,
                "authKey": param.authKey
            ]
        default:
            return ["Content-Type": "application/json"]
        }
    }
}
