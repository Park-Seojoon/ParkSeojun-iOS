//
//  LoginViewModel.swift
//  ParkSeoJun
//
//  Created by 신아인 on 2023/07/27.
//

import Foundation
import Moya

class LoginViewModel {
    let authProvider = MoyaProvider<AuthServices>()
    var authData: LoginResponse!
}

protocol LoginViewModelDelegate: AnyObject {
    func login()
}

extension LoginViewModel {
    func loginCompleted(email: String, password: String) {
        let param = LoginRequest(email: email, password: password)
        authProvider.request(.login(param: param)) { response in
            switch response {
            case .success(let result):
                print(String(data: result.data, encoding: .utf8))
                do {
                    self.authData = try result.map(LoginResponse.self)
                }catch(let err) {
                    print(String(describing: err))
                }
                let statusCode = result.statusCode
                switch statusCode{
                case 200..<300:
                    print("Login success with status code: \(statusCode)")
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
