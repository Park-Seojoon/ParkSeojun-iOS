import Foundation
import Moya

enum ProfileServices {
    case myProfile(param: MyProfileRequest )
    case myList(param: MyListRequest)
}

extension ProfileServices: TargetType {
    
    public var baseURL: URL {
        return URL(string: BaseURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .myProfile:
            return "/auth/info"
        case .myList:
            return "/user/article/myList"
        }
      
    }
    
    var method: Moya.Method {
        switch self {
        case .myProfile,.myList:
            return .get
        }
    }
    
    var sampleData: Data {
        return "@@".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .myProfile(let param):
            return ["Authorization": param.header]
        case .myList(let param):
            return ["Authorization": param.header]
        default:
            return ["Content-Type": "application/json"]
        }
    }

}

