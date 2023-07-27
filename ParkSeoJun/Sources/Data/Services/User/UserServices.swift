import Foundation
import Moya

enum UserServices {
    case list(param: UserArticleListRequest)
}

extension UserServices: TargetType {
    
    public var baseURL: URL {
        return URL(string: BaseURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .list:
            return "/user/article/list/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .list:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .list(let param):
                    return .requestParameters(parameters: param.toDictionary(), encoding: URLEncoding.queryString)
                }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return ["Content-Type": "application/json"]
        }
    }
}
