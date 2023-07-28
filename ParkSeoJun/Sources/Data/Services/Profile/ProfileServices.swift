import Foundation
import Moya

enum ProfileServices {
    case myProfile(param: MyProfileRequest)
    case myList(param: MyListRequest)
    case myAppliedList(param: MyAppliedListRequest)
    case completed(param: CompletedRequest)
}

extension ProfileServices: TargetType {
    
    public var baseURL: URL {
        return URL(string: BaseURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .myProfile:
            return "/user/info"
        case .myList:
            return "/user/article/myList"
        case .myAppliedList:
            return "/user/article/doMyList"
        case .completed(param: let param):
            return "/user/article/\(param.id)/check"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .myProfile:
            return .get
        case .myList:
            return .get
        case .myAppliedList:
            return .get
        case .completed:
            return .post
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
        case .myAppliedList(let param):
            return ["Authorization": param.header]
        case .completed(let param):
            return ["Authorization": param.header]
        default:
            return ["Content-Type": "application/json"]
        }
    }

}

