import UIKit
import Moya

class SignupViewModel {
    let authProvider = MoyaProvider<AuthServices>()
    var authData: LoginResponse!
    
    var onSignupSuccess: (() -> Void)?
    var onSignupFailure: ((String) -> Void)?
}

extension SignupViewModel {
    func signupCompleted(email: String,name: String, password: String, rePassword: String) {
        
        let param = SignupRequest.init(email: email, name: name, password: password, rePassword: rePassword)
        
        authProvider.request(.signup(param: param)) { response in
            
            switch response {
            case .success(let result):
                do {
                    
                } catch(let err) {
                    print(String(describing: err))
                }
                
                let statusCode = result.statusCode
                
                switch statusCode{
                case 200..<300:
                    self.onSignupSuccess
                    print("succes")
                case 400:
                    print("Signup failed with status code: \(statusCode)")
                default:
                    print(statusCode)
                }
            case .failure(let err):
                print(String(describing: err))
            }
        }
    }
}

