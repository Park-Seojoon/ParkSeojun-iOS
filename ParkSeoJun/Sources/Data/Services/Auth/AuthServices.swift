//
//  AuthServices.swift
//  ParkSeoJun
//
//  Created by 신아인 on 2023/07/27.
//

import Foundation
import Moya

enum AuthServices {
    case refreshToken(refreshToken: String)
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
            return "/auth/login/"
        case .signup:
            return "/auth/signup/"
        case .refreshToken:
            return "/auth/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .refreshToken:
            return .patch
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
            return .requestJSONEncodable(param)
        case .signup(let param):
                return .requestJSONEncodable(param)
        case .refreshToken:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .refreshToken(let refreshToken):
            return["Content-Type" :"application/json", "refreshToken" : refreshToken]
        default:
            return["Content-Type" :"application/json"]
        }
    }
}
