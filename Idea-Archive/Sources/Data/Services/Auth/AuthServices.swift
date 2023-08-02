import Foundation
import Moya

enum AuthServices {
    case signup(param: SignupRequest)
    case login(param: LoginRequest)
    case logout(param: LogoutRequest)
    case refreshToken(param: RefreshTokenRequest)
}
extension AuthServices: TargetType {
    
    public var baseURL: URL {
        return URL(string: BaseURL.baseURL + "/auth")!
    }
    
    var path: String {
        switch self {
        case .signup:
            return "/signup"
        case .login:
            return "/login"
        case .logout, .refreshToken:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login, .signup:
            return .post
        case .logout:
            return .delete
        case .refreshToken:
            return .patch
        }
    }
    
    var sampleData: Data {
        return "@@".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .signup(let param):
            let params : [String: String] = [
                "email" : param.email,
                "password" : param.password,
                "name": param.name
            ]
            return .requestJSONEncodable(params)
        case .login(let param):
            let params : [String: String] = [
                "email" : param.email,
                "password" : param.password
            ]
            return .requestJSONEncodable(params)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .logout(let param):
            return ["Authorization": param.accessToken]
        case .refreshToken(let param):
            return ["RefreshToken": param.refreshToken]
        default:
            return ["Content-Type": "application/json"]
        }
    }
}
