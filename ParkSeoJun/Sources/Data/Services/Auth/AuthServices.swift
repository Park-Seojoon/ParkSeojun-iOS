import Foundation
import Moya

enum AuthServices {
    case login(param: LoginRequest)
    case signup(param: SignupRequest)
}
extension AuthServices: TargetType {
    
    public var baseURL: URL {
        return URL(string: BaseURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/auth/login"
        case .signup:
            return "/auth/signup"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login, .signup:
            return .post
        }
    }
    
    var sampleData: Data {
        return "@@".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .login(let param):
            let params : [String: String] = [
                "email" : param.email,
                "password" : param.password ]
            return .requestJSONEncodable(params)
        case .signup(let param):
            return .requestJSONEncodable(param)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }
}

