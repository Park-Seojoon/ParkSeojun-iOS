import UIKit
import Moya

class CompletedViewModel {
    let completedListProvider = MoyaProvider<ProfileServices>()
}

extension CompletedViewModel {
    
    func completedList(id: Int, accessToken: String, completion: @escaping (Int) -> Void) {
        
        let param = CompletedRequest.init(id: id, header: accessToken)
        
        completedListProvider .request(.completed(param: param)) { response in
            switch response {
            case .success(let result):
                
                let statusCode = result.statusCode
                
                switch statusCode {
                case 200..<300:
                    print("완료 statusCode : \(statusCode)")
                    completion(statusCode)
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

